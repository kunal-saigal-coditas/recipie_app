import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/widget/common_widget/rounded_button_widget.dart';

import '../../../core/constants/asset_constants.dart';

class SetupPageAlertBoxWidget extends StatelessWidget {
  const SetupPageAlertBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetConstantStrings.kconfettiIcon),
        SizedBox(
          height: 8.h,
        ),
        Text(
          StringConstants.ksignUpSuccessText,
          style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        const Text(
          StringConstants.kalertDialogueSubText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        RoundedButton(
          title: StringConstants.kredirectingText,
          minWidth: double.maxFinite,
          colour: ColorConstants.primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
