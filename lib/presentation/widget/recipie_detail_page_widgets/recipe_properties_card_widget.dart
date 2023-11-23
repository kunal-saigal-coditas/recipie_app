import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/color_constants.dart';

class RecipePropertiesCardWidget extends StatelessWidget {
  const RecipePropertiesCardWidget({
    super.key,
    required this.propertyValue,
    required this.propertyName,
    required this.propertyIcon,
  });
  final String propertyValue;
  final String propertyName;
  final String propertyIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightRedBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(propertyIcon),
                Flexible(
                  child: Text(
                    ' $propertyValue',
                    style: const TextStyle(
                      color: ColorConstants.redTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Flexible(
              child: Text(
                propertyName,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
