import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/svg_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

import '../bloc/recipie_page_bloc/recipe_page_bloc.dart';

@RoutePage()
class BotttomNavPage extends StatelessWidget {
  const BotttomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RecipePageBloc>()
        ..add(
          RecipePageInitialEvent(),
        ),
      child: BlocBuilder<RecipePageBloc, RecipePageState>(
        builder: (context, state) {
          return AutoTabsScaffold(
            routes: [
              const RecipeRoute(),
              GroceryRoute(
                groceryPageList: (state is RecipeFetchingSuccessState)
                    ? state.recipeList
                    : [],
              ),
              const ExploreRoute(),
              const ForumRoute(),
              ProfileRoute(
                recipeList: (state is RecipeFetchingSuccessState)
                    ? state.recipeList
                    : [],
              ),
            ],
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                AutoRouter.of(context).push(
                  const ExploreRoute(),
                );
              },
              backgroundColor: ColorConstants.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset(
                SvgConstantStrings.ksearchIcon,
                fit: BoxFit.contain,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
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
                items: [
                  BottomNavigationBarItem(
                    label: StringConstants.krecipieText,
                    icon: SvgPicture.asset(
                      SvgConstantStrings.krecipeIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: StringConstants.kgroceryText,
                    icon: SvgPicture.asset(
                      SvgConstantStrings.kgroceryIcon,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: StringConstants.kexploreText,
                    icon: SizedBox(
                      height: 25,
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
                    label: StringConstants.kforumText,
                    icon: SvgPicture.asset(
                      SvgConstantStrings.kforumIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: StringConstants.kprofileText,
                    icon: SvgPicture.asset(
                      SvgConstantStrings.kprofileIcon,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
