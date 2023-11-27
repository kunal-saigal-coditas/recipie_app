import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../common/profile_eclipse_widget.dart';

class DiscoverMoreCardWidget extends StatelessWidget {
  const DiscoverMoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 92.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.cF5F6F5,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          12,
          15,
          12.3,
          15.9,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 103,
              height: 63,
              child: Stack(
                children: [
                  Positioned(
                    child: ProfileEclipseWidget(
                      displayImage:
                          AssetConstantStrings.kfeaturedTopicProfilePics[0],
                    ),
                  ),
                  Positioned(
                    left: 20.6,
                    child: ProfileEclipseWidget(
                      displayImage:
                          AssetConstantStrings.kfeaturedTopicProfilePics[1],
                    ),
                  ),
                  Positioned(
                    left: 41.2,
                    child: ProfileEclipseWidget(
                      displayImage:
                          AssetConstantStrings.kfeaturedTopicProfilePics[2],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            const Flexible(
              child: Text(
                softWrap: true,
                StringConstants.kdiscoverMoreText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleConstants.s14w400c001E00,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorConstants.c86BF3E,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.92),
                child: SvgPicture.asset(
                  AssetConstantStrings.karrowRightIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
