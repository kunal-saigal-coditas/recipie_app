import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/widget/common_widget/recipe_category_section_header_row.dart';
import 'package:recipe_app/presentation/widget/common_widget/rounded_button_widget.dart';

import '../../../core/constants/asset_constants.dart';

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
                style: GoogleFonts.cabin(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
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
                                buttonHeight: 35,
                                minWidth: 125,
                                textSize: 13,
                                paddingValuesLRTB: [
                                  8.w,
                                  12.h,
                                  8.w,
                                  12.h,
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
