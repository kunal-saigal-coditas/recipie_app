import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';

abstract class ForumDataRepository {
  Future<List<ForumChallengesDataEntity>> getChallengesList();

  Future<List<ForumGroupsDataEntity>> getGroupsList();

  Future<List<ForumFeaturedTopicsDataEntity>> getFeaturedTopicList();
}
