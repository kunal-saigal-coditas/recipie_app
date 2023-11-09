import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.title,
      required this.colour,
      required this.onPressed,
      this.titleColour = Colors.white});

  final Color colour;
  final Color titleColour;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 160,
          height: 45.0,
          child: Text(
            title,
            style: TextStyle(
              color: titleColour,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
