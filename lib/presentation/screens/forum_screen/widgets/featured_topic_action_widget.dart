import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/text_style_constants.dart';

class FeaturedTopicActionWidget extends StatelessWidget {
  const FeaturedTopicActionWidget({
    super.key,
    required this.svgAssetPath,
    required this.propertyText,
  });

  final String svgAssetPath;
  final String propertyText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgAssetPath,
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          propertyText,
          style: TextStyleConstants.s10w400c001E00,
        ),
      ],
    );
  }
}
