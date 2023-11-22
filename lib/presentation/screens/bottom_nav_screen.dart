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
class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RecipePageBloc>()
        ..add(
          RecipePageInitialEvent(),
        ),
      child: const BottomNavPageWidget(),
    );
  }
}

class BottomNavPageWidget extends StatelessWidget {
  const BottomNavPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipePageBloc, RecipePageState>(
      builder: (context, state) {
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
              SvgConstantStrings.ksearchIcon,
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
                    height: 20,
                  ),
                ),
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
    );
  }
}
