import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

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
        backgroundColor: ColorConstants.c86BF3E,
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
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorConstants.c0045cf.withOpacity(0.03),
                offset: const Offset(0, -12),
                blurRadius: 56,
                spreadRadius: 0,
              ),
            ],
          ),
          child: BottomNavigationBar(
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyleConstants.s12w500c86BF3E,
            unselectedItemColor: ColorConstants.c637663.withOpacity(0.7),
            selectedItemColor: ColorConstants.c86BF3E,
            unselectedLabelStyle: TextStyleConstants.s12w500c637663.copyWith(
              color: ColorConstants.c637663.withOpacity(0.7),
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
          ),
        );
      },
    );
  }
}
