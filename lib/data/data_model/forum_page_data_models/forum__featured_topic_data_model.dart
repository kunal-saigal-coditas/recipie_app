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
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'summary': summary,
      'profileImage': profileImage,
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'viewsCount': viewsCount,
    };
  }

  factory ForumFeaturedTopicsDataModel.fromJson(Map<String, dynamic> json) {
    return ForumFeaturedTopicsDataModel(
      userName: json['userName'] ?? '',
      userEmail: json['userEmail'] ?? '',
      summary: json['summary'] ?? '',
      profileImage: json['profileImage'] ?? '',
      likesCount: json['likesCount'] ?? 0,
      repliesCount: json['repliesCount'] ?? 0,
      viewsCount: json['viewsCount'] ?? 0,
    );
  }
}
