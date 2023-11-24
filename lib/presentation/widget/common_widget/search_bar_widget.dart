import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/string_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextField(
        cursorColor: ColorConstants.secondaryTextColor,
        decoration: InputDecoration(
          fillColor: ColorConstants.searchBarBackground,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          hintText: StringConstants.ksearchBarHinttext,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(16),
            width: 22,
            height: 22,
            child: SvgPicture.asset(
              AssetConstantStrings.ksearchIcon,
              colorFilter: const ColorFilter.mode(
                ColorConstants.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.all(16),
            width: 22,
            height: 22,
            child: SvgPicture.asset(
              AssetConstantStrings.kfilterIcon,
              colorFilter: const ColorFilter.mode(
                ColorConstants.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
