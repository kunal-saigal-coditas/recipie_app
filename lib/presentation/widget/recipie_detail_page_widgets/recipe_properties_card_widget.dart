import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class RecipePropertiesCardWidget extends StatelessWidget {
  const RecipePropertiesCardWidget({
    super.key,
    required this.propertyValue,
    required this.propertyName,
    required this.propertyIcon,
  });
  final String propertyValue;
  final String propertyName;
  final Icon propertyIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightRedBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  color: ColorConstants.redTextColor,
                ),
                Flexible(
                  child: Text(
                    ' $propertyValue',
                    style: const TextStyle(
                        color: ColorConstants.redTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(propertyName),
          ],
        ),
      ),
    );
  }
}
