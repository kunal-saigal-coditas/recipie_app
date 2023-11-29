import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/presentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/screens/profile_screen/widgets/profile_body_widget.dart';

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
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: Row(
            children: [
              Text(
                StringConstants.kprofilePageTitleText,
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
        child: const Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            19,
            0,
          ),
          child: ProfileScreenBodyWidget(),
        ),
      ),
    );
  }
}
