import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import '../../core/constants/asset_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/string_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: TextField(
        cursorColor: ColorConstants.cC9CDC9,
        decoration: InputDecoration(
          fillColor: ColorConstants.cF5F6F5.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide.none,
          ),
          hintText: StringConstants.ksearchBarHinttext,
          hintStyle: TextStyleConstants.s14w400c637663,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            child: SvgPicture.asset(
              width: 24,
              height: 24,
              AssetConstantStrings.ksearchIcon,
              colorFilter: const ColorFilter.mode(
                ColorConstants.c637663,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.all(16),
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              AssetConstantStrings.kfilterIcon,
              colorFilter: const ColorFilter.mode(
                ColorConstants.c637663,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
