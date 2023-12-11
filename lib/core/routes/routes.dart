import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import 'package:recipe_app/presentation/screens/bottom_nav_screen.dart';
import 'package:recipe_app/presentation/screens/explore_screen/explore_screen.dart';
import 'package:recipe_app/presentation/screens/forum_screen/forum_screen.dart';
import 'package:recipe_app/presentation/screens/grocery_screen/grocery_screen.dart';
import 'package:recipe_app/presentation/screens/login_screen/login_screen.dart';
import 'package:recipe_app/presentation/screens/onboarding_screen/splash_onboarding_page.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/preferences_screen.dart';
import 'package:recipe_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:recipe_app/presentation/screens/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/recipes_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashOnboardingRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: PreferenceRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: RecipeDetailRoute.page,
          // initial: true,
        ),
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
      ];
}
