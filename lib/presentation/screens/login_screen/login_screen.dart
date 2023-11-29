import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/presentation/screens/login_screen/cubit/auth_cubit.dart';
import 'package:recipe_app/presentation/screens/login_screen/widgets/extra_auth_options_widget.dart';
import 'package:recipe_app/presentation/screens/login_screen/widgets/login_form_widget.dart';
import 'package:recipe_app/presentation/screens/login_screen/widgets/signin_section_widget.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => GetIt.I<AuthCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20.w,
              76.h,
              20.w,
              28.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.kwelcomeToRecipePassportAppText,
                  softWrap: true,
                  style: TextStyleConstants.s32w700c001E00Cab,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  StringConstants.kpleaseEnterAccountDetailsText,
                  softWrap: true,
                  style: TextStyleConstants.s16w400c001E00,
                ),
                const SizedBox(
                  height: 40,
                ),
                LoginFormWidget(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: ColorConstants.c637663.withOpacity(0.5),
                      ),
                    ),
                    const Text(
                      StringConstants.korContinueWithText,
                      style: TextStyleConstants.s12w500c637663,
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: ColorConstants.c637663.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const ExtraAuthOptionsWidget(),
                const SizedBox(
                  height: 44,
                ),
                SignInSectionWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
