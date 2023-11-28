import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/presentation/common/rounded_button_widget.dart';

class PreferencesAlertBoxWidget extends StatelessWidget {
  const PreferencesAlertBoxWidget({super.key});

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
          style: TextStyleConstants.s24w700c001E00Cab,
        ),
        SizedBox(
          height: 8.h,
        ),
        const Text(
          StringConstants.kalertDialogueSubText,
          textAlign: TextAlign.center,
          style: TextStyleConstants.s16w400c001E00,
        ),
        SizedBox(
          height: 16.h,
        ),
        RoundedButton(
          title: StringConstants.kredirectingText,
          minWidth: double.maxFinite,
          colour: ColorConstants.c86BF3E,
          onPressed: () {},
        ),
      ],
    );
  }
}
