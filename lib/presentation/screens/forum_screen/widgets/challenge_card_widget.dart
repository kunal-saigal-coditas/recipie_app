import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';

import 'package:recipe_app/presentation/common/profile_eclipse_widget.dart';

class ChallengesSectionCardWidget extends StatelessWidget {
  const ChallengesSectionCardWidget({
    super.key,
    required this.forumChallengesDataEntity,
  });
  final ForumChallengesDataEntity forumChallengesDataEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Stack(
        // alignment: Alignment.centerLeft,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  child: Image.asset(
                    forumChallengesDataEntity.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(
                  20,
                  33,
                  14,
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      forumChallengesDataEntity.challengeName,
                      style: TextStyleConstants.s16w600c001E00,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      forumChallengesDataEntity.challengeSubtext,
                      style: TextStyleConstants.s12w400c001E00,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 34,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 4.5,
                                child: ProfileEclipseWidget(
                                  dimensions: 25,
                                  radius: 18,
                                  borderPadding: 1,
                                  displayImage: AssetConstantStrings
                                      .kfeaturedTopicProfilePics[0],
                                ),
                              ),
                              Positioned(
                                left: 14,
                                top: 4.5,
                                child: ProfileEclipseWidget(
                                  radius: 18,
                                  dimensions: 25,
                                  borderPadding: 1,
                                  displayImage: AssetConstantStrings
                                      .kfeaturedTopicProfilePics[1],
                                ),
                              ),
                              Positioned(
                                left: 24,
                                top: 4.5,
                                child: ProfileEclipseWidget(
                                  radius: 18,
                                  dimensions: 25,
                                  borderPadding: 1,
                                  displayImage: AssetConstantStrings
                                      .kfeaturedTopicProfilePics[2],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          StringConstants.k10OthersText, //add it in const file
                          maxLines: 1,
                          style: TextStyleConstants.s11w500c001E00,
                        ),
                        const Spacer(),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.c86BF3E,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 16,
                                  spreadRadius: 0,
                                  color:
                                      ColorConstants.c85bf3e.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                StringConstants.kjoinNowText,
                                style: TextStyleConstants.s14w600cFFFFFF,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 15.w,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    16.w,
                    8.h,
                    16.w,
                    8.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        forumChallengesDataEntity.date.toString(),
                        style: TextStyleConstants.s16w600cF85657,
                      ),
                      Text(
                        forumChallengesDataEntity.month,
                        style: TextStyleConstants.s12w600c001E00,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
