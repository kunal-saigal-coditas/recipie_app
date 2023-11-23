import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/image_constant.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/svg_constants.dart';

class ChallengesSectionWidget extends StatelessWidget {
  const ChallengesSectionWidget({
    super.key,
    required this.forumChallengesDataList,
  });
  final List<ForumChallengesDataEntity> forumChallengesDataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              StringConstants.kupcomingChallengeText,
              maxLines: 1, // Adjust as needed
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cabin(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: ColorConstants.greyBackground.withOpacity(0.8),
              child: SvgPicture.asset(
                SvgConstantStrings.kfilterIcon,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            shrinkWrap: true,
            itemCount: forumChallengesDataList.length,
            itemBuilder: (context, index) {
              return ChallengesSectionCardWidget(
                forumChallengesDataEntity: forumChallengesDataList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

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
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.w,
                  24.h,
                  16.w,
                  8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      forumChallengesDataEntity.challengeName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      forumChallengesDataEntity.challengeSubtext,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: Stack(
                            children: [
                              Image.asset(
                                ImageConstants.kfeaturedTopicProfilePics[0],
                              ),
                              Positioned(
                                left: 15,
                                child: Image.asset(
                                  ImageConstants.kfeaturedTopicProfilePics[1],
                                ),
                              ),
                              Positioned(
                                left: 30,
                                child: Image.asset(
                                  ImageConstants.kfeaturedTopicProfilePics[2],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Text(
                          "and 10 Others",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        RoundedButton(
                          minWidth: 105,
                          buttonHeight: 34,
                          title: StringConstants.kjoinNowText,
                          colour: ColorConstants.primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 50.h,
            left: 10.w,
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorConstants.redTextColor,
                        ),
                      ),
                      Text(
                        forumChallengesDataEntity.month,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
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
