import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/constants/color_constants.dart';
import 'featured_topic_action_widget.dart';

class FeaturedTopicSectionWidget extends StatelessWidget {
  const FeaturedTopicSectionWidget({
    super.key,
    required this.forumFeaturedTopicsDataList,
  });
  final List<ForumFeaturedTopicsDataEntity> forumFeaturedTopicsDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        shrinkWrap: true,
        itemCount: forumFeaturedTopicsDataList.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    forumFeaturedTopicsDataList[index].profileImage,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          forumFeaturedTopicsDataList[index].userName,
                          style: TextStyleConstants.s15w600c001E00,
                        ),
                        Text(
                          " ${forumFeaturedTopicsDataList[index].userEmail}",
                          style: TextStyleConstants.s12w400c001E00,
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.cF5F6F5.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            size: 17,
                            color: ColorConstants.c001E00,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      StringConstants.k1hAgoText,
                      style: TextStyleConstants.s12w400c001E00.copyWith(
                        color: ColorConstants.c001E00.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      forumFeaturedTopicsDataList[index].summary,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleConstants.s12w400c001E00,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AssetConstantStrings.kgroceryPageImages[4],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].likesCount} likes',
                          svgAssetPath: AssetConstantStrings.kheartFilledIcon,
                        ),
                        // const Spacer(),
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].repliesCount} replies',
                          svgAssetPath: AssetConstantStrings.krepliesIcon,
                        ),
                        // const Spacer(),
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].viewsCount} views',
                          svgAssetPath: AssetConstantStrings.kviewsIcon,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
