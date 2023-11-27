import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          image: AssetImage(categoryImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: TextStyleConstants.s16w600cFFFFFF,
        ),
      ),
    );
  }
}
