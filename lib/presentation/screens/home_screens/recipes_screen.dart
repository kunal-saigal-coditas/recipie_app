import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/widget/common_widget/appbar_title_row_widget.dart';
import 'package:recipe_app/presentation/widget/common_widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/recipe_page_widget/discover_more_card_widget.dart';

import '../../widget/recipe_page_widget/recipe_video_card.dart';

@RoutePage()
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RecipePageBloc>()
        ..add(
          RecipePageInitialEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitleRowWidget(
            pageTitle: StringConstants.krecipePageAppBarText,
            appBarButtonOnTap: () {},
          ),
        ),
        body: BlocBuilder<RecipePageBloc, RecipePageState>(
          builder: (context, state) {
            if (state is RecipeFetchingSuccessState) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 16.w,
                  right: 16.w,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RecipeVideoCard(
                        width: double.maxFinite,
                        recipeEntity: state.recipeList[3],
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.krecentRecipeText,
                        recipeList: state.recipeList,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const DiscoverMoreCardWidget(),
                      SizedBox(
                        height: 12.h,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.krecommendedText,
                        recipeList: List.from(state.recipeList)..shuffle(),
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
