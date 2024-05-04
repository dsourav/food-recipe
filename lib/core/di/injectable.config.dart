// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;

import '../../features/data/datasources/remote/food_recipe_remote_data_source.dart'
    as _i4;
import '../../features/data/repositories/food_recipe_repository_impl.dart'
    as _i6;
import '../../features/domain/repositories/food_recipe_repository.dart' as _i5;
import '../../features/domain/usecases/get_all_food_recipe_usecase.dart' as _i7;
import '../../features/domain/usecases/get_one_recipe_usecase.dart' as _i8;
import '../../features/presentation/blocs/food_recipe_search/food_recipe_search_bloc.dart'
    as _i12;
import '../../features/presentation/cubits/food_recipe_details/food_recipe_details_cubit.dart'
    as _i11;
import '../network/dio_client.dart' as _i13;
import '../network/network_info.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioClient = _$DioClient();
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Dio>(() => dioClient.dio());
  gh.factory<_i4.FoodRecipeRemoteDataSource>(
      () => _i4.FoodRecipeRemoteDataSourceImpl(gh<_i3.Dio>()));
  gh.factory<_i5.FoodRecipeRepository>(
      () => _i6.FoodRecipeRepositoryImpl(gh<_i4.FoodRecipeRemoteDataSource>()));
  gh.factory<_i7.GetAllRecipeUseCase>(
      () => _i7.GetAllRecipeUseCase(gh<_i5.FoodRecipeRepository>()));
  gh.factory<_i8.GetOneRecipeUseCase>(
      () => _i8.GetOneRecipeUseCase(gh<_i5.FoodRecipeRepository>()));
  gh.factory<_i9.InternetConnectionChecker>(
      () => networkModule.checkConnection());
  gh.factory<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(gh<_i9.InternetConnectionChecker>()));
  gh.factory<_i11.FoodRecipeDetailsCubit>(
      () => _i11.FoodRecipeDetailsCubit(gh<_i8.GetOneRecipeUseCase>()));
  gh.factory<_i12.FoodRecipeSearchBloc>(
      () => _i12.FoodRecipeSearchBloc(gh<_i7.GetAllRecipeUseCase>()));
  return getIt;
}

class _$DioClient extends _i13.DioClient {}

class _$NetworkModule extends _i10.NetworkModule {}
