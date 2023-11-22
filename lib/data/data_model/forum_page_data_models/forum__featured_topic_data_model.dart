import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';

class ForumFeaturedTopicsDataModel extends ForumFeaturedTopicsDataEntity {
  const ForumFeaturedTopicsDataModel({
    required super.userName,
    required super.userEmail,
    required super.summary,
    required super.profileImage,
    required super.likesCount,
    required super.repliesCount,
    required super.viewsCount,
  });
}
