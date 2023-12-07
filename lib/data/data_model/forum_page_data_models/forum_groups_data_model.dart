import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';

class ForumGroupsDataModel extends ForumGroupsDataEntity {
  const ForumGroupsDataModel({
    required super.groupName,
    required super.groupFollowerCount,
    required super.groupPic,
    required super.isJoined,
  });

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'groupFollowerCount': groupFollowerCount,
      'groupPic': groupPic,
      'isJoined': isJoined,
    };
  }

  // Create an object from a Map
  factory ForumGroupsDataModel.fromJson(Map<String, dynamic> json) {
    return ForumGroupsDataModel(
      groupName: json['groupName'] ?? '',
      groupFollowerCount: json['groupFollowerCount'] ?? '',
      groupPic: json['groupPic'] ?? '',
      isJoined: json['isJoined'] ?? false,
    );
  }
}
