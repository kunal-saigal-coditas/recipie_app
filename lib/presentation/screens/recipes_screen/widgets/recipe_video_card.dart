import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class RecipeVideoCard extends StatelessWidget {
  const RecipeVideoCard({
    super.key,
    required this.recipeEntity,
    this.height = 194,
    required this.onPressed,
  });
  final RecipeEntity recipeEntity;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          opacity: 5,
          image: CachedNetworkImageProvider(
            recipeEntity.image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  ColorConstants.c131313.withOpacity(0.00),
                  ColorConstants.c131313.withOpacity(0.72),
                  ColorConstants.c131313,
                  ColorConstants.c131313.withOpacity(0.85),
                ],
                stops: const [
                  0,
                  0.5,
                  1,
                  1,
                ],
              ),
              backgroundBlendMode: BlendMode.darken,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              15,
              0,
              16,
              12,
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetConstantStrings.ktimerIcon,
                              height: 8.h,
                              width: 8.w,
                              colorFilter: const ColorFilter.mode(
                                ColorConstants.cFFFFFF,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '${recipeEntity.readyInMinutes.toString()} mins',
                              style: TextStyleConstants.s8w400cFFFFFF,
                            ),
                          ],
                        ),
                        Text(
                          StringConstants.kweeklyPickText,
                          maxLines: 1,
                          style: TextStyleConstants.s23w600cFFFFFFCab,
                        ),
                        SizedBox(
                          width: 230.w,
                          child: Text(
                            recipeEntity.summary,
                            maxLines: 2,
                            style: TextStyleConstants.s13w400cC9CDC9,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: onPressed,
                      child: SvgPicture.asset(
                        AssetConstantStrings.kplayIcon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
