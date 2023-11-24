import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

import '../../core/constants/asset_constants.dart';

@RoutePage()
class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        RecipeRoute(),
        GroceryRoute(),
        ExploreRoute(),
        ForumRoute(),
        ProfileRoute(),
      ],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          AutoRouter.of(context).navigate(
            const ExploreRoute(),
          );
        },
        backgroundColor: ColorConstants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset(
          AssetConstantStrings.ksearchIcon,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: ColorConstants.secondaryTextColor,
          selectedItemColor: ColorConstants.primaryColor,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorConstants.secondaryTextColor,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: StringConstants.krecipieText,
              icon: SvgPicture.asset(
                AssetConstantStrings.krecipeIcon,
              ),
            ),
            BottomNavigationBarItem(
              label: StringConstants.kgroceryText,
              icon: SvgPicture.asset(
                AssetConstantStrings.kgroceryIcon,
              ),
            ),
            const BottomNavigationBarItem(
              label: StringConstants.kexploreText,
              icon: SizedBox(
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: StringConstants.kforumText,
              icon: SvgPicture.asset(
                AssetConstantStrings.kforumIcon,
              ),
            ),
            BottomNavigationBarItem(
              label: StringConstants.kprofileText,
              icon: SvgPicture.asset(
                AssetConstantStrings.kprofileIcon,
              ),
            ),
          ],
        );
      },
    );
  }
}
