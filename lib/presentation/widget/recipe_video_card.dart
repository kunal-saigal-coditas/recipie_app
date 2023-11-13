import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class RecipeVideoCard extends StatelessWidget {
  const RecipeVideoCard({
    super.key,
    required this.recipeEntity,
    this.height = 160,
    this.width = 240,
    required this.onPressed,
  });
  final RecipeEntity recipeEntity;
  final double height;
  final double width;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image:
                // NetworkImage(recipeEntity.image)
                AssetImage(recipeEntity.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipeEntity.title,
                style: const TextStyle(
                  color: ColorConstants.whiteBackgraound,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              Text(
                recipeEntity.summary,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 13,
                  color: ColorConstants.whiteBackgraound,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
