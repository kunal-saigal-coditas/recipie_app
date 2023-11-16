import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/image_constant.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.recipeList});
  final List<RecipeEntity> recipeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              StringConstants.kprofilePageTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.settings_outlined,
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<ProfileBloc>()
          ..add(
            FetchProfilePageDataEvent(recipieList: recipeList),
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileFetchingSuccessState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(
                              ImageConstants.konboardingBackgroundImage,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                StringConstants.kuserName,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                StringConstants.kuserEmail,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorConstants.secondaryTextColor),
                              ),
                              RoundedButton(
                                title: StringConstants.keditProfileText,
                                colour: ColorConstants.whiteBackgraound,
                                onPressed: () {},
                                titleColour: ColorConstants.primaryTextColor,
                                buttonHeight: 38,
                                minWidth: 125,
                                paddingValuesLRTB: const [7, 10, 7, 10],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.kfavoriesText,
                        ontap: () {},
                        recipeList: state.favoriteRecipiesList,
                      ),

                      //Duplicated
                      const SizedBox(
                        height: 12,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.krecentRecipeText,
                        ontap: () {},
                        recipeList: state.favoriteRecipiesList,
                      ),
                    ],
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
