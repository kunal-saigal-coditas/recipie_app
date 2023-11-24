import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.title,
    required this.colour,
    required this.onPressed,
    this.titleColour = Colors.white,
    this.minWidth = 160,
    this.buttonHeight = 45,
    this.paddingValuesLRTB = const [14, 10, 14, 10],
    this.textSize = 16,
  });

  final Color colour;
  final Color titleColour;
  final String title;
  final Function() onPressed;
  final double minWidth;
  final double buttonHeight;
  final List<double> paddingValuesLRTB;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      child: Material(
        elevation: 1,
        color: colour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.r,
          ),
          side: BorderSide(
            color: colour == ColorConstants.whiteBackgraound
                ? ColorConstants.greyBackground
                : ColorConstants.greyBackground,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth.w,
          height: buttonHeight.h,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              paddingValuesLRTB[0],
              paddingValuesLRTB[1],
              paddingValuesLRTB[2],
              paddingValuesLRTB[3],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  color: titleColour,
                  fontSize: textSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
