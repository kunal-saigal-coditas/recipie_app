import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/widget/recipe_card_widget.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/string_constants.dart';

class RecipeCategorySectionHeaderRowWidget extends StatelessWidget {
  const RecipeCategorySectionHeaderRowWidget(
      {super.key,
      required this.categoryName,
      required this.ontap,
      required this.recipeList});
  final String categoryName;
  final Function() ontap;
  final List<RecipeEntity> recipeList;

  @override
  Widget build(BuildContext context) {
    recipeList.shuffle();
    return Column(
      children: [
        Row(
          children: [
            Text(
              categoryName,
              style: GoogleFonts.cabin(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: ontap,
              child: const Text(
                StringConstants.kviewAlltext,
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                return RecipeCardWidget(
                  currentRecipe: recipeList[index],
                  recipeList: recipeList,
                );
              },
            )),
      ],
    );
  }
}
