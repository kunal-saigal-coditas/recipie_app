import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/widget/appbar_title_row_widget.dart';
import 'package:recipe_app/presentation/widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/recipe_video_card.dart';

@RoutePage()
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleRowWidget(
          pageTitle: StringConstants.krecipePageAppBarText,
          appBarButtonOnTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<RecipePageBloc, RecipePageState>(
          builder: (context, state) {
            if (state is RecipeFetchingSuccessState) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RecipeVideoCard(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.28,
                      recipeEntity: state.recipeList[3],
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RecipeCategorySectionHeaderRowWidget(
                      categoryName: StringConstants.krecentRecipeText,
                      recipeList: state.recipeList,
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RecipeCategorySectionHeaderRowWidget(
                      categoryName: StringConstants.krecommendedText,
                      recipeList: List.from(state.recipeList)..shuffle(),
                      ontap: () {},
                    ),
                  ],
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
