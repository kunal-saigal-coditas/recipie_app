import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/presentation/bloc/forum_page_bloc/forum_page_bloc.dart';
import 'package:recipe_app/presentation/widget/forum_page_widgets/forum_page_task_bar_widget.dart';

import '../../../core/constants/string_constants.dart';
import '../../widget/appbar_title_row_widget.dart';

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
            padding: EdgeInsets.fromLTRB(
              16,
              8,
              16,
              0,
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
