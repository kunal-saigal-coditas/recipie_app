import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/presentation/screens/login_screen/widgets/icon_container_widget.dart';

class ExtraAuthOptionsWidget extends StatelessWidget {
  const ExtraAuthOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: ColorConstants.cC9CDC9,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetConstantStrings.kgoogleIcon,
                    height: 23.85,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    StringConstants.kgoogleText,
                    style: TextStyleConstants.s15w500c052C05,
                  ),
                ],
              ),
            ),
          ),
        ),
        IconContainerWidget(
          onTap: () {},
          iconImage: AssetConstantStrings.kfacebookIcon,
        ),
        IconContainerWidget(
          onTap: () {},
          iconImage: AssetConstantStrings.ktwitterIcon,
        ),
        IconContainerWidget(
          onTap: () {},
          iconImage: AssetConstantStrings.kappleIcon,
        ),
      ],
    );
  }
}
