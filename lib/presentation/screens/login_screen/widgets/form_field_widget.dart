import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

class LoginFormFieldWidget extends StatelessWidget {
  LoginFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String prefixIcon;
  final bool isPassword;
  final String? Function(String?) validator;

  final ValueNotifier<bool> boolNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: boolNotifier,
        builder: (context, value, child) {
          return TextFormField(
            obscureText: isPassword ? value : isPassword,
            validator: validator,
            obscuringCharacter: StringConstants.kstarString,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  14,
                  10,
                  14,
                ),
                child: SvgPicture.asset(
                  prefixIcon,
                ),
              ),
              suffixIcon: Visibility(
                visible: isPassword,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    2,
                    14,
                    24,
                    14,
                  ),
                  child: InkWell(
                    onTap: () {
                      boolNotifier.value = !boolNotifier.value;
                    },
                    child: SvgPicture.asset(
                      AssetConstantStrings.kvisibilityIcon,
                    ),
                  ),
                ),
              ),
              hintStyle: TextStyleConstants.s15w500c637663,
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorConstants.cC9CDC9,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          );
        });
  }

  void dispose() {
    boolNotifier.dispose();
  }
}
