import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/constants/string_constants.dart';

import 'package:recipe_app/presentation/common/appbar_title_row_widget.dart';
import 'package:recipe_app/presentation/common/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/widgets/discover_more_card_widget.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/widgets/recipe_video_card.dart';

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
            pageTitle: StringConstants.kexploreRecipiesText,
            appBarButtonOnTap: () {},
          ),
        ),
        body: BlocBuilder<RecipePageBloc, RecipePageState>(
          builder: (context, state) {
            if (state is RecipeFetchingSuccessState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<RecipePageBloc>().add(
                        RecipePageInitialEvent(),
                      );
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 19,
                    right: 21,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RecipeVideoCard(
                          recipeEntity: state.recipeList[3],
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        RecipeCategorySectionHeaderRowWidget(
                          categoryName: StringConstants.krecentRecipeText,
                          recipeList: state.recipeList,
                          ontap: () {},
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const DiscoverMoreCardWidget(),
                        const SizedBox(
                          height: 14,
                        ),
                        RecipeCategorySectionHeaderRowWidget(
                          categoryName: StringConstants.krecommendedText,
                          recipeList: state.recipeList,
                          ontap: () {},
                        ),
                      ],
                    ),
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
