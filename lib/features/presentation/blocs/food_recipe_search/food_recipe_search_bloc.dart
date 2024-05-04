import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/db/local_db.dart';
import 'package:food_recipe/core/utils/constant.dart';
import 'package:food_recipe/core/utils/extensions.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:food_recipe/features/domain/usecases/get_all_food_recipe_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'food_recipe_search_event.dart';
part 'food_recipe_search_state.dart';

@Injectable()
class FoodRecipeSearchBloc extends Bloc<FoodRecipeSearchEvent, FoodRecipeSearchState> {
  final GetAllRecipeUseCase getAllRecipeUseCase;
  int page = 1;
  List<FoodRecipeEntity> foodRecipes = [];

  FoodRecipeSearchBloc(this.getAllRecipeUseCase) : super(FoodRecipeSearchInitial()) {
    on<FoodRecipeSearchEvent>((event, emit) async {
      if (event is FoodRecipeSearchTermChanged) {
        await _handleFoodRecipeSearchTermChanged(event, emit);
      } else if (event is FoodRecipeLoadMore) {
        await _handleFoodRecipeLoadMore(event, emit);
      } else if (event is FoodRecipeUpdateLocal) {
        _handleFoodRecipeUpdateLocal(event, emit);
      }
    }, transformer: (eventStream, eventHandler) {
      final nonDebounceEventStream = eventStream.where(
        (event) => event is! FoodRecipeSearchTermChanged,
      );

      final debounceEventStream =
          eventStream.whereType<FoodRecipeSearchTermChanged>().debounceTime(const Duration(milliseconds: 500));

      final mergedEventStream = MergeStream([
        nonDebounceEventStream,
        debounceEventStream,
      ]);

      final restartableTransformer = restartable<FoodRecipeSearchEvent>();
      return restartableTransformer(mergedEventStream, eventHandler);
    });
  }

  Future _handleFoodRecipeSearchTermChanged(
      FoodRecipeSearchTermChanged event, Emitter<FoodRecipeSearchState> emit) async {
    final searchTerm = event.searchTerm.trim();
    if (searchTerm.isEmpty) {
      page = 1;
      foodRecipes = [];
      emit(FoodRecipeSearchInitial());
      return;
    }

    emit(FoodRecipeLoading());

    final response = await getAllRecipeUseCase
        .call(GetAllFoodRecipeParams(offset: page * Constant.itemPerPage, searchTerm: searchTerm));

    response.fold(
        (error) => emit(FoodRecipeLoadingFailed()),
        (items) => emit(FoodRecipesLoaded(
            foodRecipeEntity: items.withLocalSavedFlag, hasReachedMax: items.length < Constant.itemPerPage)));
  }

  Future _handleFoodRecipeLoadMore(FoodRecipeLoadMore event, Emitter<FoodRecipeSearchState> emit) async {
    final currentState = state;
    final searchTerm = event.searchTerm.trim();

    if (_hasReachedMax(currentState)) return;

    if (currentState is FoodRecipesLoaded) {
      page = page + 1;

      final response = await getAllRecipeUseCase
          .call(GetAllFoodRecipeParams(offset: page * Constant.itemPerPage, searchTerm: searchTerm));

      response.fold((error) {}, (items) {
        foodRecipes = currentState.foodRecipeEntity + items;
        final recipesWithSavedFlag = foodRecipes.withLocalSavedFlag;
        if (items.isEmpty) {
          emit(currentState.copyWith(hasReachedMax: true));
        } else {
          emit(currentState.copyWith(foodRecipeEntity: recipesWithSavedFlag, hasReachedMax: false));
        }
      });
    }
  }

  bool _hasReachedMax(FoodRecipeSearchState state) => state is FoodRecipesLoaded && state.hasReachedMax;

  void _handleFoodRecipeUpdateLocal(FoodRecipeUpdateLocal event, Emitter<FoodRecipeSearchState> emit) {
    final currentState = state;

    if (currentState is FoodRecipesLoaded) {
      final allEntity = currentState.foodRecipeEntity;

      final index = allEntity.indexOf(event.entity);
      if (index < 0) return;

      final selectedRecipe = allEntity[index];
      selectedRecipe.isSavedLocally = !selectedRecipe.isSavedLocally;
      allEntity[index] = selectedRecipe;

      emit(FoodRecipeSearchInitial());
      emit(currentState.copyWith(foodRecipeEntity: allEntity));
    }
    LocalDB.updateLocalRecipe(event.entity);
  }
}
