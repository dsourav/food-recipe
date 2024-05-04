import 'package:flutter/material.dart';
import 'package:food_recipe/core/utils/app_decorations.dart';
import 'package:food_recipe/features/presentation/widgets/app_network_image.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/list_page_placeholder.dart';

class SavedFoodRecipePage extends StatelessWidget {
  const SavedFoodRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ingredients = [
      "1 Egg",
      "1 Avacoado",
      "sauce Mic",
      "Masala Fry",
      "French juice",
      "1 Egg",
      "1 Avacoado",
      "sauce Mic",
      "Masala Fry",
      "French juice",
      "1 Egg",
      "1 Avacoado",
      "sauce Mic",
      "Masala Fry",
      "French juice",
      "1 Egg",
      "1 Avacoado",
      "sauce Mic",
      "Masala Fry",
      "French juice"
    ];

    return Stack(
      // fit: StackFit.expand,
      children: [
        const SizedBox(
          height: 280,
          width: double.infinity,
          child: AppNetworkImage(
            imageUrl: "https://via.placeholder.com/140x100",
            imageShape: ImageShape.square,
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 200),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 300.0),
                  width: double.infinity,
                  decoration: AppDecorations.cardDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Toast with Egg & avocado",
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 2.0,
                              children: [
                                const Icon(
                                  Icons.punch_clock_outlined,
                                  size: 18,
                                ),
                                Text("15 min", style: theme.textTheme.titleSmall)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text("Ingredients", style: theme.textTheme.titleMedium),
                        ...ingredients.map((item) => Container(
                              margin: EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 16,
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(item)
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text("Instructions", style: theme.textTheme.titleMedium),
                Text(
                  '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
            
                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
