import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/recipe_entity/recipe_entity.dart';
import '../../presentation/screens/bottom_nav_screen.dart';
import '../../presentation/screens/home_screens/explore_screen.dart';
import '../../presentation/screens/home_screens/forum_screen.dart';
import '../../presentation/screens/home_screens/grocery_screen.dart';
import '../../presentation/screens/home_screens/profile_screen.dart';
import '../../presentation/screens/home_screens/recipes_screen.dart';
import '../../presentation/screens/onboarding_screen/splash_onboarding_page.dart';
import '../../presentation/screens/recipe_detail_screen/recipe_detail_screen.dart';
import '../../presentation/screens/setup_screen/setup_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomNavRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: RecipeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: GroceryRoute.page,
              // initial: true,
            ),
            AutoRoute(
              page: ExploreRoute.page,
              // initial: true,
            ),
            AutoRoute(
              page: ForumRoute.page,
              // initial: true,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              // initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: SplashOnboardingRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: SetupRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: RecipeDetailRoute.page,
          // initial: true,
        ),
      ];
}
