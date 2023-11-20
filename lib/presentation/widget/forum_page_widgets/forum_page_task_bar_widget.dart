import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

import '../../../core/constants/color_constants.dart';

class ForumPageTabBarWidget extends StatelessWidget {
  const ForumPageTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          Container(
            // height: 48,
            decoration: BoxDecoration(
              color: ColorConstants.secondaryTextColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              labelColor: ColorConstants.whiteBackgraound,
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorConstants.primaryColor,
              ),
              dividerColor: ColorConstants.whiteBackgraound,
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
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: double.minPositive,
            child: TabBarView(
              children: [
                Container(
                  child: const Text("data"),
                ),
                Container(
                  child: const Text("data"),
                ),
                Container(
                  child: const Text("data"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
