import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../../core/constants/color_constants.dart';

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
              color: ColorConstants.secondaryTextColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TabBar(
                labelColor: ColorConstants.whiteBackgraound,
                indicatorPadding: const EdgeInsets.all(2),
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorConstants.primaryColor,
                ),
                dividerColor: ColorConstants.whiteBackgraound,
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
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: SingleChildScrollView(
                    child: Text(
                      recipeEntity.instructions,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
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
                              borderRadius: BorderRadius.circular(12.r),
                              color: ColorConstants.primaryColor,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstants.whiteBackgraound,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              recipeEntity.directions[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
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
