import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/constants/svg_constants.dart';

class GroupsSectionWidget extends StatelessWidget {
  const GroupsSectionWidget({
    super.key,
    required this.groupsDataList,
  });
  final List<ForumGroupsDataEntity> groupsDataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              StringConstants.kallGroupsText,
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
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            shrinkWrap: true,
            itemCount: groupsDataList.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    groupsDataList[index].groupPic,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupsDataList[index].groupName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${groupsDataList[index].groupFollowerCount} Members',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ColorConstants.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  RoundedButton(
                    minWidth: 85,
                    titleColour: groupsDataList[index].isJoined
                        ? ColorConstants.primaryColor
                        : ColorConstants.whiteBackgraound,
                    title: groupsDataList[index].isJoined
                        ? StringConstants.kjoinedText
                        : StringConstants.kjoinText,
                    colour: groupsDataList[index].isJoined
                        ? ColorConstants.whiteBackgraound
                        : ColorConstants.primaryColor,
                    onPressed: () {},
                    textSize: 14,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
