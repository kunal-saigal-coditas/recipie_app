import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

@RoutePage()
class BotttomNavPage extends StatelessWidget {
  const BotttomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          RecipeRoute(),
          GroceryRoute(),
          ForumRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            iconSize: 32,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: ColorConstants.secondaryTextColor,
            selectedItemColor: ColorConstants.secondaryColor,
            unselectedLabelStyle: const TextStyle(
              color: ColorConstants.secondaryTextColor,
            ),
            elevation: 1,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Recipes',
                icon: Icon(
                  Icons.food_bank_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Grocery',
                icon: Icon(
                  Icons.list,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Forum',
                icon: Icon(
                  Icons.forum_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person_2_outlined,
                ),
              ),
            ],
          );
        });
  }
}
