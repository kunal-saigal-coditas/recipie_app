import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/image_constant.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

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
            ImageConstants.konboardingBackgroundImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                const Text(
                  StringConstants.konboardingMaintext,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    StringConstants.konboardingSubtext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RoundedButton(
                    title: StringConstants.kgettingStartedButton,
                    colour: ColorConstants.primaryColor,
                    onPressed: () {
                      AutoRouter.of(context).replace(const SetupRoute());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
