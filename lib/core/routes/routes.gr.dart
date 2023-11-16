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
    BotttomNavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BotttomNavPage(),
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
      final args = routeData.argsAs<GroceryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GroceryPage(
          key: args.key,
          groceryPageList: args.groceryPageList,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          recipeList: args.recipeList,
        ),
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
    SetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetupPage(),
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
/// [BotttomNavPage]
class BotttomNavRoute extends PageRouteInfo<void> {
  const BotttomNavRoute({List<PageRouteInfo>? children})
      : super(
          BotttomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'BotttomNavRoute';

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
class GroceryRoute extends PageRouteInfo<GroceryRouteArgs> {
  GroceryRoute({
    Key? key,
    required List<RecipeEntity> groceryPageList,
    List<PageRouteInfo>? children,
  }) : super(
          GroceryRoute.name,
          args: GroceryRouteArgs(
            key: key,
            groceryPageList: groceryPageList,
          ),
          initialChildren: children,
        );

  static const String name = 'GroceryRoute';

  static const PageInfo<GroceryRouteArgs> page =
      PageInfo<GroceryRouteArgs>(name);
}

class GroceryRouteArgs {
  const GroceryRouteArgs({
    this.key,
    required this.groceryPageList,
  });

  final Key? key;

  final List<RecipeEntity> groceryPageList;

  @override
  String toString() {
    return 'GroceryRouteArgs{key: $key, groceryPageList: $groceryPageList}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required List<RecipeEntity> recipeList,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            recipeList: recipeList,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.recipeList,
  });

  final Key? key;

  final List<RecipeEntity> recipeList;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, recipeList: $recipeList}';
  }
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
/// [SetupPage]
class SetupRoute extends PageRouteInfo<void> {
  const SetupRoute({List<PageRouteInfo>? children})
      : super(
          SetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

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
