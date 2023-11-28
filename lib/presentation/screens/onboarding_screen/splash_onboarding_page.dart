import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

import 'package:recipe_app/presentation/common/rounded_button_widget.dart';

@RoutePage()
class SplashOnboardingPage extends StatelessWidget {
  const SplashOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetConstantStrings.konboardingBackgroundImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ColorConstants.c000000,
                  ColorConstants.c000000.withOpacity(0.0),
                ],
                stops: const [0.1802, 1.0],
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              28,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      StringConstants.konboardingMaintext,
                      style: GoogleFonts.cabin(
                        fontSize: 40,
                        color: ColorConstants.cFFFFFF,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        StringConstants.konboardingSubtext,
                        textAlign: TextAlign.center,
                        style: TextStyleConstants.s16w400cFFFFFF,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RoundedButton(
                        title: StringConstants.kgettingStartedButton,
                        colour: ColorConstants.c86BF3E,
                        onPressed: () {
                          AutoRouter.of(context).replace(
                            const PreferenceRoute(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
