import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/asset_constants.dart';
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
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(recipeEntity.image),
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
                        backgroundColor: ColorConstants
                            .secondaryWhiteBackgraound
                            .withOpacity(0.3),
                        child: InkWell(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: ColorConstants.whiteBackgraound,
                            size: 25,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: ColorConstants
                            .secondaryWhiteBackgraound
                            .withOpacity(0.3),
                        child: const Icon(
                          Icons.fullscreen_exit,
                          size: 25,
                          color: ColorConstants.whiteBackgraound,
                        ),
                      )
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
                      Text(
                        recipeEntity.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.share_outlined,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            AssetConstants.konboardingBackgroundImage),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "email@email.com",
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorConstants.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("235 Likes")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  RecipeDetailTabBarSectionWidget(recipeEntity: recipeEntity),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: '${recipeEntity.readyInMinutes} mins',
                          propertyName: "Cook Time",
                          propertyIcon: const Icon(Icons.access_time),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: '245',
                          propertyName: "Calories",
                          propertyIcon:
                              Icon(Icons.local_fire_department_outlined),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Flexible(
                        child: RecipePropertiesCardWidget(
                          propertyValue: 'Korea',
                          propertyName: "Origin",
                          propertyIcon: Icon(Icons.location_on_outlined),
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
