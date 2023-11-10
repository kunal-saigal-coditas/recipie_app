import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.settings_outlined,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                          AssetConstants.konboardingBackgroundImage)),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "email@email.com",
                        style: TextStyle(
                            fontSize: 12,
                            color: ColorConstants.secondaryTextColor),
                      ),
                      RoundedButton(
                        title: "Edit Profile",
                        colour: ColorConstants.whiteBackgraound,
                        onPressed: () {},
                        titleColour: ColorConstants.primaryTextColor,
                        buttonHeight: 38,
                        minWidth: 125,
                        paddingValuesLRTB: const [7, 10, 7, 10],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
