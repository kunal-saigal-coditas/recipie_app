import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import 'package:recipe_app/presentation/screens/recipes_screen/bloc/recipe_page_bloc.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget({
    super.key,
    required this.currentRecipe,
    required this.recipeList,
  });
  final RecipeEntity currentRecipe;
  final List<RecipeEntity> recipeList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          RecipeDetailRoute(
            recipeEntity: currentRecipe,
          ),
        );
      },
      child: Hero(
        tag: 'pic${currentRecipe.id}',
        child: Container(
          width: 161,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                currentRecipe.image,
              ),
              opacity: 5,
              onError: (exception, stackTrace) {
                log(
                  currentRecipe.id.toString(),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      ColorConstants.c001E00.withOpacity(0),
                      ColorConstants.c001E00.withOpacity(0.31),
                      ColorConstants.c001E00,
                    ],
                    stops: const [
                      0.0,
                      0.3118,
                      0.997,
                    ],
                  ),
                  backgroundBlendMode: BlendMode.darken,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  9,
                  8,
                  9,
                  11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Visibility(
                          visible: context.routeData.name == RecipeRoute.name,
                          child: Material(
                            color: ColorConstants.c0FFFFFF,
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<RecipePageBloc>(context).add(
                                  AddToFavoritesEvent(
                                    recipeEntity: currentRecipe,
                                    recipeList: recipeList,
                                  ),
                                );
                              },
                              child: Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  color:
                                      ColorConstants.cFFFFFF.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: currentRecipe.isFavorite
                                      ? const Icon(
                                          Icons.favorite,
                                          color: ColorConstants.cF85657,
                                          size: 16.2,
                                        )
                                      : SvgPicture.asset(
                                          AssetConstantStrings.kheartIcon,
                                          theme: const SvgTheme(
                                            currentColor:
                                                ColorConstants.cFFFFFF,
                                          ),
                                        ),
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
                      style: TextStyleConstants.s9w500cC9CDC9,
                    ),
                    Text(
                      currentRecipe.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleConstants.s13w600cFFFFFFCab,
                    ),
                    Row(
                      children: [
                        Text(
                          'Lunch | ${currentRecipe.readyInMinutes} m',
                          maxLines: 2,
                          style: TextStyleConstants.s14w400cC9CDC9,
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AssetConstantStrings.kratingsIcon,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
