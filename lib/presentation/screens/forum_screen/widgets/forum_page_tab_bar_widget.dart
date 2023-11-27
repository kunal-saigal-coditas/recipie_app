import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/color_constants.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/presentation/screens/forum_screen/bloc/forum_page_bloc.dart';
import 'package:recipe_app/presentation/screens/forum_screen/widgets/forum_featured_topics_widget.dart';
import 'package:recipe_app/presentation/screens/forum_screen/widgets/forum_groups_widget.dart';

import 'forum_challenges_widget.dart';

class ForumPageTabBarWidget extends StatelessWidget {
  const ForumPageTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumPageBloc, ForumPageState>(
      builder: (context, state) {
        if (state is ForumPageSuccessState) {
          return DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: ColorConstants.cF5F6F5.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(46),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: TabBar(
                      labelColor: ColorConstants.cFFFFFF,
                      labelStyle: TextStyleConstants.s12w600cFFFFFF,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(46),
                        color: ColorConstants.c86BF3E,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                            spreadRadius: 0,
                            color: ColorConstants.c5a5a5a.withOpacity(0.17),
                          ),
                        ],
                      ),
                      dividerColor: ColorConstants.cFFFFFF,
                      dividerHeight: 0,
                      tabs: const [
                        Tab(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              StringConstants.kfeaturedTopicsText,
                            ),
                          ),
                        ),
                        Tab(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              StringConstants.kchallengesText,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Tab(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              StringConstants.kgroupsText,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 541.h,
                  child: TabBarView(
                    children: [
                      FeaturedTopicSectionWidget(
                        forumFeaturedTopicsDataList: state.featuredTopicList,
                      ),
                      ChallengesSectionWidget(
                        forumChallengesDataList: state.challengesDataList,
                      ),
                      GroupsSectionWidget(
                        groupsDataList: state.groupsDataList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
