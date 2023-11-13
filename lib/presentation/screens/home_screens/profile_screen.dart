import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/recipe_card_list_widget.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Profile",
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
            FetchProfilePageData(),
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
                                AssetConstants.konboardingBackgroundImage),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "email@email.com",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorConstants.secondaryTextColor),
                              ),
                              RoundedButton(
                                title: "Edit Profile",
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
                        categoryName: StringConstants.krecentRecipeText,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: RecipieCardListWidget(
                          onPressed: () {},
                          sectionRecipeList: const [
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: [],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: [],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: ["instructions"],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Duplicated
                      const SizedBox(
                        height: 12,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.krecentRecipeText,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: RecipieCardListWidget(
                          onPressed: () {},
                          sectionRecipeList: const [
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: [],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: [],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                            RecipeEntity(
                              id: 1,
                              title: "title",
                              summary: "summary",
                              image: "assets/images/splash_background.png",
                              readyInMinutes: 10,
                              sourceUrl: "sourceUrl",
                              // instructions: ["instructions"],
                              extendedIngredients: [
                                ExtendedIngredientEntity(
                                    amount: 2,
                                    id: 2,
                                    image: "image",
                                    name: "name"),
                              ],
                            ),
                          ],
                        ),
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
