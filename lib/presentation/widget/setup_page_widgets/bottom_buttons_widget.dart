import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

class BottomButtonsWidgets extends StatelessWidget {
  const BottomButtonsWidgets({
    super.key,
    required this.previousButtonOnTap,
    required this.nextButtonOnTap,
  });
  final void Function() previousButtonOnTap;
  final void Function() nextButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedButton(
          title: "Pervious",
          titleColour: ColorConstants.primaryTextColor,
          colour: ColorConstants.whiteBackgraound,
          onPressed: previousButtonOnTap,
        ),
        RoundedButton(
          title: "Next Step",
          colour: ColorConstants.primaryColor,
          onPressed: nextButtonOnTap,
        )
      ],
    );
  }
}
