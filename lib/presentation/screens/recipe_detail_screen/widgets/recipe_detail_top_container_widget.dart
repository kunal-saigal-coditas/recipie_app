import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';

class RecipeDetailTopContainerWidget extends StatelessWidget {
  const RecipeDetailTopContainerWidget({
    super.key,
    required this.recipeImage,
  });

  final String recipeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 316.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(recipeImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  ColorConstants.c001E00.withOpacity(0),
                  ColorConstants.c001E00.withOpacity(0.573),
                  ColorConstants.c001E00.withOpacity(0.308),
                ],
                stops: const [0.0, 0.5728, 0.9082],
              ),
              backgroundBlendMode: BlendMode.darken,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            ColorConstants.cFFFFFF.withOpacity(0.2),
                        child: InkWell(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            AssetConstantStrings.kgoBackIcon,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor:
                            ColorConstants.cFFFFFF.withOpacity(0.29),
                        child: SvgPicture.asset(
                          AssetConstantStrings.kexpandIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetConstantStrings.kplayIcon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
