import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import 'package:recipe_app/presentation/screens/recipe_detail_screen/widgets/recipe_detail_tabbar.dart';
import 'package:recipe_app/presentation/screens/recipe_detail_screen/widgets/recipe_properties_card_widget.dart';

@RoutePage()
class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipeEntity,
  });

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 316.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(recipeEntity.image),
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
                        child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AssetConstantStrings.kplayIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        recipeEntity.title,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleConstants.s24w700c001E00Cab,
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor:
                            ColorConstants.cF5F6F5.withOpacity(0.8),
                        child: SvgPicture.asset(
                          AssetConstantStrings.kshareIcon,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Divider(
                    color: ColorConstants.cC9CDC9.withOpacity(0.35),
                    height: 0.6,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          AssetConstantStrings.kprofileImage,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            StringConstants.kuserName,
                            style: TextStyleConstants.s16w600c001E00,
                          ),
                          Text(
                            StringConstants.kuserEmail,
                            style: TextStyleConstants.s14w500c637663,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetConstantStrings.kheartFilledIcon,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            StringConstants.kfakeLikes,
                            style: TextStyleConstants.s14w600c001E00,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Divider(
                    color: ColorConstants.cC9CDC9.withOpacity(0.35),
                    height: 0.6,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  RecipeDetailTabBarSectionWidget(
                    recipeEntity: recipeEntity,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: '${recipeEntity.readyInMinutes} mins',
                          propertyName: StringConstants.kcookTimeText,
                          propertyIcon: AssetConstantStrings.ktimerIcon,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: StringConstants.k245Text,
                          leftAlign: true,
                          propertyName: StringConstants.kcalorietext,
                          propertyIcon: AssetConstantStrings.kcaloriesIcon,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: recipeEntity.country,
                          propertyName: StringConstants.koriginText,
                          propertyIcon: AssetConstantStrings.klocationIcon,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.kreviewsText,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleConstants.s20w700c001E00Cab,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AssetConstantStrings.karrowRightGreenIcon,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
