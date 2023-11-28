import 'package:flutter/material.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

class ErrorMesssageWidget extends StatelessWidget {
  const ErrorMesssageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        StringConstants.kerrorMessage,
        style: TextStyleConstants.s14w500c001E00,
        softWrap: true,
      ),
    );
  }
}
