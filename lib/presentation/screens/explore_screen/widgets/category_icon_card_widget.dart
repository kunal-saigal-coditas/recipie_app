import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });
  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: CachedNetworkImageProvider(categoryImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.c001E00.withOpacity(0),
                  ColorConstants.c001E00.withOpacity(0.3),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
              backgroundBlendMode: BlendMode.darken,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Text(
              categoryName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyleConstants.s16w600cFFFFFF,
            ),
          ),
        ],
      ),
    );
  }
}
