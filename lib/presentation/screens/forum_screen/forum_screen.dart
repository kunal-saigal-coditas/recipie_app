import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/common/appbar_title_row_widget.dart';
import 'package:recipe_app/presentation/screens/forum_screen/bloc/forum_page_bloc.dart';

import 'package:recipe_app/presentation/screens/forum_screen/widgets/forum_page_tab_bar_widget.dart';

@RoutePage()
class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleRowWidget(
          pageTitle: StringConstants.kforumText,
          appBarButtonOnTap: () {},
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<ForumPageBloc>()
          ..add(
            ForumPageDataFetchingEvent(),
          ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                ForumPageTabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
