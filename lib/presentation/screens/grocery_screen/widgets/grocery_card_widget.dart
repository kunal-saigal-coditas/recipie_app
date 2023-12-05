import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';

class GroceryCard extends StatelessWidget {
  const GroceryCard({
    super.key,
    required this.groceryDataEntity,
  });
  final GroceryDataEntity groceryDataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.cFFFFFF,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 6),
            spreadRadius: 0,
            color: ColorConstants.c000000.withOpacity(0.05),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: ColorConstants.cFFFFFF,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    ColorConstants.c001E00.withOpacity(0),
                    ColorConstants.c001E00.withOpacity(0.5728),
                    ColorConstants.c001E00.withOpacity(0.3082),
                  ],
                  stops: const [
                    0.0,
                    0.5728,
                    0.9082,
                  ],
                ),
                backgroundBlendMode: BlendMode.darken,
              ),
              height: 80,
              width: 90,
              child: CachedNetworkImage(
                imageUrl: groceryDataEntity.groceryImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                11,
                15,
                18,
                18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groceryDataEntity.groceryName,
                    style: TextStyleConstants.s15w600c001E00Cab,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    groceryDataEntity.grocerySubtext,
                    style: TextStyleConstants.s12w400c001E00,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
