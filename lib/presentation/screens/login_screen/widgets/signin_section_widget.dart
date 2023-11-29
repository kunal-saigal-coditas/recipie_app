import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/presentation/screens/login_screen/cubit/auth_cubit.dart';

class SignInSectionWidget extends StatelessWidget {
  const SignInSectionWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          StringConstants.kalreadyHaveAccountText,
          style: TextStyleConstants.s15w500c637663,
        ),
        InkWell(
          onTap: () {
            context.read<AuthCubit>().registerWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
          },
          child: const Text(
            StringConstants.ksignInText,
            style: TextStyleConstants.s15w600c6AA920,
          ),
        ),
      ],
    );
  }
}
