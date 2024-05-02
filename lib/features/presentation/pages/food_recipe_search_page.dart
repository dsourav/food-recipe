import 'package:flutter/material.dart';
import 'package:food_recipe/features/presentation/widgets/app_network_image.dart';

class FoodRecipeSearchPage extends StatelessWidget {
  const FoodRecipeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Write Recipe Name',
              suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ),
          ),

          Container(
            height: 203,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // #000000 with 20% opacity
                  offset: const Offset(0, 4), // X: 0, Y: 4
                  blurRadius: 4, // Blur: 4
                  spreadRadius: 0, // Spread: 0
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                      child: Stack(
                        children: [
                          const AppNetworkImage(
                            size: Size(double.infinity, double.infinity),
                            imageUrl: "https://via.placeholder.com/140x100",
                            imageShape: ImageShape.square,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Container(
                                height: 32,
                                width: 32,
                                margin: const EdgeInsets.all(10.0),
                                decoration:
                                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                                child: const Icon(Icons.bookmark_outline)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Alu vorta pasta likewise sjkajsjaksdkjansdbjadnjadnajkndjsandak",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
          // Expanded(child: child)
        ],
      ),
    );
  }
}
