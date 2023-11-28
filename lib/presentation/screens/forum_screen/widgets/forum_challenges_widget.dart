import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';

import 'package:recipe_app/presentation/screens/forum_screen/widgets/challenge_card_widget.dart';

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
              backgroundColor: ColorConstants.cF5F6F5.withOpacity(0.8),
              child: SvgPicture.asset(
                AssetConstantStrings.kfilterIcon,
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
