import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/presentation/common/rounded_button_widget.dart';
import 'package:recipe_app/presentation/screens/login_screen/cubit/auth_cubit.dart';
import 'package:recipe_app/presentation/screens/login_screen/widgets/form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          LoginFormFieldWidget(
            validator: (value) {
              if (value!.isEmpty) {
                return StringConstants.kfeildCannotBeEmptyText;
              }
              return null;
            },
            controller: nameController,
            hintText: StringConstants.kfullNameText,
            prefixIcon: AssetConstantStrings.kuserIcon,
          ),
          const SizedBox(
            height: 16,
          ),
          LoginFormFieldWidget(
            validator: (value) {
              if (value!.isEmpty) {
                return StringConstants.kfeildCannotBeEmptyText;
              }
              return null;
            },
            controller: emailController,
            hintText: StringConstants.kemailAddressText,
            prefixIcon: AssetConstantStrings.kemailIcon,
          ),
          const SizedBox(
            height: 14,
          ),
          LoginFormFieldWidget(
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return StringConstants.kpleaseEnterCorrectPasswordText;
              }
              return null;
            },
            isPassword: true,
            controller: passwordController,
            hintText: StringConstants.kpasswordText,
            prefixIcon: AssetConstantStrings.kpasswordIcon,
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ColorConstants.c86BF3E,
                  ),
                ),
                child: const SizedBox(
                  height: 17,
                  width: 17,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                child: Text(
                  StringConstants.ktermsAndConditionText,
                  style: TextStyleConstants.s14w500c6AA920,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                AutoRouter.of(context).replace(
                  const PreferenceRoute(),
                );
              }
            },
            child: RoundedButton(
              minWidth: MediaQuery.of(context).size.width,
              title: StringConstants.kcontinueText,
              colour: ColorConstants.c86BF3E,
              onPressed: () {
                context.read<AuthCubit>().signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
