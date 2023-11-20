import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/svg_constants.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

class SetupPageAlertBoxWidget extends StatelessWidget {
  const SetupPageAlertBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(SvgConstantStrings.kconfettiIcon),
        const SizedBox(
          height: 8,
        ),
        Text(
          StringConstants.ksignUpSuccessText,
          style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          StringConstants.kalertDialogueSubText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
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
