import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/presentation/common/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/common/rounded_button_widget.dart';
import 'package:recipe_app/presentation/screens/profile_screen/bloc/profile_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
          ),
          child: Row(
            children: [
              Text(
                StringConstants.kprofilePageTitle,
                style: TextStyleConstants.s24w700c001E00Cab,
              ),
              const Spacer(),
              const Icon(
                Icons.settings_outlined,
              )
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<ProfileBloc>()
          ..add(
            FetchProfilePageDataEvent(),
          ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16.w,
            16.h,
            16.w,
            0,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileFetchingSuccessState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundImage: const AssetImage(
                              AssetConstantStrings.kprofileImage,
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                StringConstants.kuserName,
                                style: TextStyleConstants.s24w700c001E00Cab,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                StringConstants.kuserEmail,
                                style: TextStyleConstants.s12w500c637663,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              RoundedButton(
                                title: StringConstants.keditProfileText,
                                colour: ColorConstants.cFFFFFF,
                                onPressed: () {},
                                titleColour: ColorConstants.c001E00,
                                buttonHeight: 24,
                                minWidth: 125,
                                textSize: 13,
                                paddingValuesLTRB: const [
                                  10,
                                  7,
                                  10,
                                  7,
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RecipeCategorySectionHeaderRowWidget(
                        categoryName: StringConstants.kfavoriesText,
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
