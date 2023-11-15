import 'package:flutter/material.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../../core/constants/color_constants.dart';

class RecipeDetailTabBarSectionWidget extends StatelessWidget {
  const RecipeDetailTabBarSectionWidget(
      {super.key, required this.recipeEntity});
  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            // indicatorSize: TabBarIndicatorSize.label,
            labelColor: ColorConstants.whiteBackgraound,
            indicatorPadding: const EdgeInsets.all(2),
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorConstants.secondaryColor,
            ),
            dividerColor: ColorConstants.whiteBackgraound,
            tabs: const [
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Ingredients",
              ),
              Tab(
                text: "Direction",
              ),
            ],
          ),
          SizedBox(
            height: 170,
            child: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    recipeEntity.summary,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    recipeEntity.instructions,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    recipeEntity.summary,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
