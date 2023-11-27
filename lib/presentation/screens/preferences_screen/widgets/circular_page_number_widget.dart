import 'package:flutter/material.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

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
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 26,
        width: 26,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? ColorConstants.c001E00 : ColorConstants.cB2BBB2,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: ColorConstants.cFFFFFF,
          child: Text(pageNumber.toString(),
              style: TextStyleConstants.s14w500c001E00.copyWith(
                color: isSelected
                    ? ColorConstants.c001E00
                    : ColorConstants.cB2BBB2,
              )),
        ),
      ),
    );
  }
}
