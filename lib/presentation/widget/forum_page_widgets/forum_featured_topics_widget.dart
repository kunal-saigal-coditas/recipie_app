import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/constants/image_constant.dart';
import 'package:recipe_app/core/constants/svg_constants.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';

import '../../../core/constants/color_constants.dart';

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
          return const SizedBox(height: 16);
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
              const SizedBox(
                width: 8,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          " ${forumFeaturedTopicsDataList[index].userEmail}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.greyBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            size: 17,
                            color: ColorConstants.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1h ago',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.primaryTextColor.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      forumFeaturedTopicsDataList[index].summary,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            ImageConstants.kgroceryPageImages[4],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].likesCount} likes',
                          svgAssetPath: SvgConstantStrings.kheartFilledIcon,
                        ),
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].repliesCount} replies',
                          svgAssetPath: SvgConstantStrings.krepliesIcon,
                        ),
                        FeaturedTopicActionWidget(
                          propertyText:
                              '${forumFeaturedTopicsDataList[index].viewsCount} views',
                          svgAssetPath: SvgConstantStrings.kviewsIcon,
                        ),
                      ],
                    )
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

class FeaturedTopicActionWidget extends StatelessWidget {
  const FeaturedTopicActionWidget({
    super.key,
    required this.svgAssetPath,
    required this.propertyText,
  });

  final String svgAssetPath;
  final String propertyText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          SvgPicture.asset(
            svgAssetPath,
            height: 14,
            width: 14,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            propertyText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
