import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/presentation/widget/common_widget/rounded_button_widget.dart';

import '../../../core/constants/asset_constants.dart';

@RoutePage()
class SplashOnboardingPage extends StatelessWidget {
  const SplashOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AssetConstantStrings.konboardingBackgroundImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            right: 10.w,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Text(
                    StringConstants.konboardingMaintext,
                    style: GoogleFonts.cabin(
                      fontSize: 40,
                      color: ColorConstants.whiteBackgraound,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      StringConstants.konboardingSubtext,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.whiteBackgraound,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                      title: StringConstants.kgettingStartedButton,
                      colour: ColorConstants.primaryColor,
                      onPressed: () {
                        AutoRouter.of(context).replace(
                          const SetupRoute(),
                        );
                      },
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
