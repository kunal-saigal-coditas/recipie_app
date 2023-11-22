import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';

class ForumGroupsDataModel extends ForumGroupsDataEntity {
  const ForumGroupsDataModel({
    required super.groupName,
    required super.groupFollowerCount,
    required super.groupPic,
    required super.isJoined,
  });
}
