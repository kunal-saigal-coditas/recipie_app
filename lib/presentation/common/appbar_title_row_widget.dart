import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

class AppBarTitleRowWidget extends StatelessWidget {
  const AppBarTitleRowWidget({
    super.key,
    required this.pageTitle,
    required this.appBarButtonOnTap,
  });
  final String pageTitle;
  final Function() appBarButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 13.h,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Text(
            pageTitle,
            style: TextStyleConstants.s24w700c001E00Cab,
          ),
          const Spacer(),
          InkWell(
            onTap: appBarButtonOnTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: ColorConstants.cC9CDC9,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  AssetConstantStrings.kaddIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
