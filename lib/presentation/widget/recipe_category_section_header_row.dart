import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/string_constants.dart';

class RecipeCategorySectionHeaderRowWidget extends StatelessWidget {
  const RecipeCategorySectionHeaderRowWidget(
      {super.key, required this.categoryName, required this.ontap});
  final String categoryName;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          categoryName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
          onPressed: ontap,
          child: const Text(
            StringConstants.kviewAlltext,
            style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
