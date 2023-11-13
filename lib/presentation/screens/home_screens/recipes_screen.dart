import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/recipe_video_card.dart';
import 'package:recipe_app/presentation/widget/recipe_card_list_widget.dart';

@RoutePage()
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              StringConstants.krecipePageAppBarText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: ColorConstants.secondaryTextColor),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) =>
              GetIt.I<RecipePageBloc>()..add(RecipePageInitialEvent()),
          child: SingleChildScrollView(
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
                          recipeEntity: state.recipeList[0],
                          onPressed: () {
                            print("hello");
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RecipeCategorySectionHeaderRowWidget(
                          categoryName: StringConstants.krecentRecipeText,
                          ontap: () {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: RecipieCardListWidget(
                            onPressed: () {},
                            sectionRecipeList: state.recipeList,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RecipeCategorySectionHeaderRowWidget(
                          categoryName: StringConstants.krecommendedText,
                          ontap: () {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: RecipieCardListWidget(
                            onPressed: () {},
                            sectionRecipeList: state.recipeList,
                          ),
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
        ),
      ),
    );
  }
}
