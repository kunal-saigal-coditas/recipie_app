import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.title,
    required this.colour,
    required this.onPressed,
    this.titleColour = Colors.white,
    this.minWidth = 160,
    this.buttonHeight = 45,
    this.paddingValuesLRTB = const [14, 10, 14, 10],
  });

  final Color colour;
  final Color titleColour;
  final String title;
  final Function() onPressed;
  final double minWidth;
  final double buttonHeight;
  final List<double> paddingValuesLRTB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Material(
        elevation: 1,
        color: colour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
              color: colour == ColorConstants.whiteBackgraound
                  ? const Color.fromARGB(255, 160, 158, 158)
                  : const Color.fromARGB(0, 255, 254, 254)),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth,
          height: buttonHeight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              paddingValuesLRTB[0],
              paddingValuesLRTB[1],
              paddingValuesLRTB[2],
              paddingValuesLRTB[3],
            ),
            child: Text(
              title,
              style: TextStyle(
                color: titleColour,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
