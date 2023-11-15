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
        // ExploreRoute(),
        ForumRoute(),
        ProfileRoute(),
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     AutoRouter.of(context).push(
      //       const ExploreRoute(),
      //     );
      //   },
      //   backgroundColor: ColorConstants.secondaryColor,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      //   child: const Icon(
      //     Icons.search,
      //     color: ColorConstants.whiteBackgraound,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            iconSize: 32,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: ColorConstants.secondaryTextColor,
            selectedItemColor: ColorConstants.secondaryColor,
            unselectedLabelStyle: const TextStyle(
              color: ColorConstants.secondaryTextColor,
            ),
            // elevation: 6,
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
              // BottomNavigationBarItem(
              //   label: 'Explore',
              //   icon: FloatingActionButton(
              //     backgroundColor: ColorConstants.secondaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     onPressed: () {
              //       tabsRouter.setActiveIndex(2);
              //     },
              //     child: const Icon(
              //       Icons.search,
              //       color: ColorConstants.whiteBackgraound,
              //     ),
              //   ),
              // ),
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
          ),
        );
      },
    );
  }
}
