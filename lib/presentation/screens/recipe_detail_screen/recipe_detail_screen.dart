import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/svg_constants.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/constants/color_constants.dart';
import '../../../domain/entity/recipe_entity/recipe_entity.dart';
import '../../widget/recipie_detail_page_widgets/recipe_detail_tabbar.dart';
import '../../widget/recipie_detail_page_widgets/recipe_properties_card_widget.dart';

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
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(recipeEntity.image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorConstants.greyBackground,
                        child: InkWell(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            SvgConstantStrings.kgoBackIcon,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: ColorConstants.greyBackground,
                        child: SvgPicture.asset(
                          SvgConstantStrings.kexpandIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          recipeEntity.title,
                          maxLines: 1, // Adjust as needed
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cabin(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor:
                              ColorConstants.greyBackground.withOpacity(0.8),
                          child: SvgPicture.asset(
                            SvgConstantStrings.kshareIcon,
                            // colorFilter: const ColorFilter.mode(
                            //   ColorConstants.whiteBackgraound,
                            //   BlendMode.srcIn,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          ImageConstants.kprofileImage,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            StringConstants.kuserName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            StringConstants.kuserEmail,
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorConstants.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(SvgConstantStrings.kheartFilledIcon),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            StringConstants.kfakeLikes,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RecipeDetailTabBarSectionWidget(
                    recipeEntity: recipeEntity,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: '${recipeEntity.readyInMinutes} mins',
                          propertyName: StringConstants.kcookTimeText,
                          propertyIcon: SvgConstantStrings.ktimerIcon,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: '245',
                          propertyName: StringConstants.kcalorietext,
                          propertyIcon: SvgConstantStrings.kcaloriesIcon,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: recipeEntity.country,
                          propertyName: StringConstants.koriginText,
                          propertyIcon: SvgConstantStrings.klocationIcon,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
