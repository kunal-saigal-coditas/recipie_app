import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/color_constants.dart';

class CircularPageNumberIndicatorWidget extends StatelessWidget {
  const CircularPageNumberIndicatorWidget({
    super.key,
    required this.pageNumber,
    this.isSelected = false,
  });
  final int pageNumber;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 26.h,
          maxWidth: 16.w,
        ),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.primaryTextColor
              : ColorConstants.cicularPageIndicatorBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: ColorConstants.whiteBackgraound,
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              fontSize: 14,
              color: isSelected
                  ? ColorConstants.primaryTextColor
                  : ColorConstants.cicularPageIndicatorBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
