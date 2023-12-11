import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import 'package:recipe_app/presentation/common/recipe_card_widget.dart';

class RecipeCategorySectionHeaderRowWidget extends StatelessWidget {
  const RecipeCategorySectionHeaderRowWidget({
    super.key,
    required this.categoryName,
    required this.ontap,
    required this.recipeList,
  });
  final String categoryName;
  final Function() ontap;
  final List<RecipeEntity> recipeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              categoryName,
              style: TextStyleConstants.s20w600c001E00Cab,
            ),
            const Spacer(),
            InkWell(
              onTap: ontap,
              child: const Text(
                StringConstants.kviewAlltext,
                style: TextStyleConstants.s14w400c6AA920,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: recipeList.length,
            itemBuilder: (context, index) {
              return RecipeCardWidget(
                currentRecipe: recipeList[index],
                recipeList: recipeList,
              );
            },
          ),
        ),
      ],
    );
  }
}
