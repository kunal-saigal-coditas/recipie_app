import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

import '../../core/constants/image_constant.dart';

class DiscoverMoreCardWidget extends StatelessWidget {
  const DiscoverMoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorConstants.secondaryTextColor.withOpacity(0.05),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 104,
              height: 62,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                        ImageConstants.kfeaturedTopicProfilePics[0],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                        ImageConstants.kfeaturedTopicProfilePics[1],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 20,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                        ImageConstants.kfeaturedTopicProfilePics[2],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Flexible(
              flex: 6,
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
            const Spacer(),
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
