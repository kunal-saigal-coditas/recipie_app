import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../../../core/constants/color_constants.dart';

class RecipeDetailTabBarSectionWidget extends StatelessWidget {
  const RecipeDetailTabBarSectionWidget({
    super.key,
    required this.recipeEntity,
  });
  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: ColorConstants.cF5F6F5.withOpacity(0.8),
              borderRadius: BorderRadius.circular(46),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TabBar(
                labelColor: ColorConstants.cFFFFFF,
                labelStyle: TextStyleConstants.s12w600c637663,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(46),
                  color: ColorConstants.c86BF3E,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 12,
                      spreadRadius: 0,
                      color: ColorConstants.c5a5a5a.withOpacity(0.17),
                    ),
                  ],
                ),
                dividerColor: ColorConstants.cFFFFFF,
                dividerHeight: 0,
                tabs: const [
                  Tab(
                    text: StringConstants.koverviewText,
                  ),
                  Tab(
                    text: StringConstants.kingredientsText,
                  ),
                  Tab(
                    text: StringConstants.kdirectionsText,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 170.h,
            child: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  child: SingleChildScrollView(
                    child: Text(
                      recipeEntity.summary,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyleConstants.s15w500c354D35,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: SingleChildScrollView(
                    child: Text(
                      recipeEntity.instructions,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyleConstants.s15w600c001E00,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8.h,
                      );
                    },
                    itemCount: recipeEntity.directions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstants.c86BF3E,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${index + 1}",
                                style: TextStyleConstants.s12w700cFFFFFF,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              recipeEntity.directions[index],
                              softWrap: true,
                              style: TextStyleConstants.s14w500c052C05,
                            ),
                          ),
                        ],
                      );
                    },
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
