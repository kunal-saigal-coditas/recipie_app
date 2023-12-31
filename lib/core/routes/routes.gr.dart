// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExplorePage(),
      );
    },
    ForumRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForumPage(),
      );
    },
    GroceryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GroceryPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    PreferenceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PreferencePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RecipeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecipeDetailPage(
          key: args.key,
          recipeEntity: args.recipeEntity,
        ),
      );
    },
    RecipeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecipePage(),
      );
    },
    SplashOnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashOnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [BottomNavPage]
class BottomNavRoute extends PageRouteInfo<void> {
  const BottomNavRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExplorePage]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute({List<PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForumPage]
class ForumRoute extends PageRouteInfo<void> {
  const ForumRoute({List<PageRouteInfo>? children})
      : super(
          ForumRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForumRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GroceryPage]
class GroceryRoute extends PageRouteInfo<void> {
  const GroceryRoute({List<PageRouteInfo>? children})
      : super(
          GroceryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroceryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PreferencePage]
class PreferenceRoute extends PageRouteInfo<void> {
  const PreferenceRoute({List<PageRouteInfo>? children})
      : super(
          PreferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreferenceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecipeDetailPage]
class RecipeDetailRoute extends PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({
    Key? key,
    required RecipeEntity recipeEntity,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeDetailRoute.name,
          args: RecipeDetailRouteArgs(
            key: key,
            recipeEntity: recipeEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailRoute';

  static const PageInfo<RecipeDetailRouteArgs> page =
      PageInfo<RecipeDetailRouteArgs>(name);
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({
    this.key,
    required this.recipeEntity,
  });

  final Key? key;

  final RecipeEntity recipeEntity;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{key: $key, recipeEntity: $recipeEntity}';
  }
}

/// generated route for
/// [RecipePage]
class RecipeRoute extends PageRouteInfo<void> {
  const RecipeRoute({List<PageRouteInfo>? children})
      : super(
          RecipeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashOnboardingPage]
class SplashOnboardingRoute extends PageRouteInfo<void> {
  const SplashOnboardingRoute({List<PageRouteInfo>? children})
      : super(
          SplashOnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashOnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
