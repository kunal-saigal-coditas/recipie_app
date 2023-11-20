import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/svg_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../core/constants/color_constants.dart';
import '../../core/routes/routes.dart';
import '../bloc/recipie_page_bloc/recipe_page_bloc.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget(
      {super.key, required this.currentRecipe, required this.recipeList});
  final RecipeEntity currentRecipe;
  final List<RecipeEntity> recipeList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(
            RecipeDetailRoute(recipeEntity: currentRecipe),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(currentRecipe.image),
              opacity: 5,
              onError: (exception, stackTrace) {
                log(
                  currentRecipe.id.toString(),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<RecipePageBloc>(context).add(
                          AddToFavoritesEvent(
                            recipeEntity: currentRecipe,
                            recipeList: recipeList,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.greyBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            SvgConstantStrings.kheartIcon,
                            theme: SvgTheme(
                              currentColor: currentRecipe.isFavorite
                                  ? ColorConstants.redTextColor
                                  : ColorConstants.whiteBackgraound,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  currentRecipe.country,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.whiteBackgraound,
                  ),
                ),
                Text(
                  currentRecipe.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cabin(
                    color: ColorConstants.whiteBackgraound,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Lunch | ${currentRecipe.readyInMinutes} min',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.whiteBackgraound,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      SvgConstantStrings.kratingsIcon,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
