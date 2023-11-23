import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/widget/forum_page_widgets/forum_featured_topics_widget.dart';
import 'package:recipe_app/presentation/widget/forum_page_widgets/forum_groups_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../bloc/forum_page_bloc/forum_page_bloc.dart';
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
                    color: ColorConstants.secondaryTextColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: TabBar(
                      labelColor: ColorConstants.whiteBackgraound,
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: ColorConstants.primaryColor,
                      ),
                      dividerColor: ColorConstants.whiteBackgraound,
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
                  height: 16,
                ),
                SizedBox(
                  height: 550.h,
                  // MediaQuery.of(context).size.height * 0.68,
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
