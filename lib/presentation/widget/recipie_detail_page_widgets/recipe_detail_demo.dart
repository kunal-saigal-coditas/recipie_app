import 'package:flutter/material.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/widget/recipie_detail_page_widgets/recipe_detail_tabbar.dart';
import 'package:recipe_app/presentation/widget/recipie_detail_page_widgets/recipe_properties_card_widget.dart';
import '../../../core/constants/asset_constants.dart';

import '../../../core/constants/color_constants.dart';

class RecipeDetailsDemo extends StatelessWidget {
  const RecipeDetailsDemo({
    super.key,
    required this.recipeEntity,
  });
  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.maxFinite,
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipeEntity.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    recipeEntity.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share_outlined,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage(AssetConstants.konboardingBackgroundImage),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "email@email.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstants.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("235 Likes")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              RecipeDetailTabBarSectionWidget(recipeEntity: recipeEntity),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: RecipePropertiesCardWidget(
                      propertyValue: '${recipeEntity.readyInMinutes} mins',
                      propertyName: "Cook Time",
                      propertyIcon: const Icon(Icons.access_time),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Flexible(
                    child: RecipePropertiesCardWidget(
                      propertyValue: '245',
                      propertyName: "Calories",
                      propertyIcon: Icon(Icons.local_fire_department_outlined),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Flexible(
                    child: RecipePropertiesCardWidget(
                      propertyValue: 'Korea',
                      propertyName: "Origin",
                      propertyIcon: Icon(Icons.location_on_outlined),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
