import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constants.dart';

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
        top: 16.h,
        bottom: 8.h,
      ),
      child: Row(
        children: [
          Text(
            pageTitle,
            style: GoogleFonts.cabin(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: appBarButtonOnTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: ColorConstants.secondaryTextColor.withOpacity(0.5),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
