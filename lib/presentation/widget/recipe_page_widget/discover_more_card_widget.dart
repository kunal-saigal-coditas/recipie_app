import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

import '../../../core/constants/asset_constants.dart';

class DiscoverMoreCardWidget extends StatelessWidget {
  const DiscoverMoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorConstants.cF5F6F5CC.withOpacity(
          0.8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 103,
              height: 62,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: ColorConstants.cF5F7FB,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                            AssetConstantStrings.kfeaturedTopicProfilePics[0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: ColorConstants.cF5F7FB,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                            AssetConstantStrings.kfeaturedTopicProfilePics[1],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 20,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: ColorConstants.cF5F7FB,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                            AssetConstantStrings.kfeaturedTopicProfilePics[2],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            const Flexible(
              // flex: 6,
              child: Text(
                StringConstants.kdiscoverMoreText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            // const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: ColorConstants.whiteBackgraound,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
