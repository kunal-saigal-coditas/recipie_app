import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/constants/color_constants.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({
    super.key,
    required this.iconImage,
    required this.onTap,
  });

  final String iconImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(
            color: ColorConstants.cC9CDC9,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            iconImage,
            height: 23.85,
            width: 24,
          ),
        ),
      ),
    );
  }
}
