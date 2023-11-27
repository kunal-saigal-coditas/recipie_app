import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';

class ProfileEclipseWidget extends StatelessWidget {
  const ProfileEclipseWidget({
    super.key,
    required this.displayImage,
    this.dimensions = 61.85,
    this.radius = 61.84,
    this.borderPadding = 3,
  });
  final String displayImage;
  final double dimensions;
  final double radius;
  final double borderPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: ColorConstants.cFFFFFF,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderPadding),
        child: Image.asset(
          fit: BoxFit.cover,
          height: dimensions,
          width: dimensions,
          displayImage,
        ),
      ),
    );
  }
}
