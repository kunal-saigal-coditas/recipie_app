import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
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
        color: ColorConstants.whiteBackgraound,
        boxShadow: [
          BoxShadow(
            blurRadius: 12.r,
            offset: const Offset(0, 6),
            spreadRadius: 0,
            color: ColorConstants.primaryTextColor.withOpacity(0.05),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 2,
          color: ColorConstants.greyBackground,
        ),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Image.asset(
              groceryDataEntity.groceryImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groceryDataEntity.groceryName,
                    style: GoogleFonts.cabin(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    groceryDataEntity.grocerySubtext,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
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
