import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import '../../../../core/constants/color_constants.dart';

class RecipePropertiesCardWidget extends StatelessWidget {
  const RecipePropertiesCardWidget(
      {super.key,
      required this.propertyValue,
      required this.propertyName,
      required this.propertyIcon,
      this.leftAlign = false});
  final String propertyValue;
  final String propertyName;
  final String propertyIcon;
  final bool leftAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.cF85657.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          12,
          8,
          16,
          8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: leftAlign
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                SvgPicture.asset(propertyIcon),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    ' $propertyValue',
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleConstants.s14w500cF85657,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Flexible(
              child: Text(
                propertyName,
                style: TextStyleConstants.s12w500c354D35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
