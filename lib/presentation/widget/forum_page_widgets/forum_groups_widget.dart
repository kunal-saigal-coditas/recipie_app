import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/string_constants.dart';

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
              return SizedBox(height: 16.h);
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
                  SizedBox(
                    width: 8.w,
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
                  SizedBox(
                    width: 85.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          groupsDataList[index].isJoined
                              ? ColorConstants.whiteBackgraound
                              : ColorConstants.primaryColor,
                        ),
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                            return BorderSide(
                              color: groupsDataList[index].isJoined
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.transparentColor,
                              width: 1.0,
                            );
                          },
                        ),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            groupsDataList[index].isJoined
                                ? StringConstants.kjoinedText
                                : StringConstants.kjoinText,
                            style: TextStyle(
                              color: groupsDataList[index].isJoined
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.whiteBackgraound,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
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
