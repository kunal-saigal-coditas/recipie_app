import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';
import 'package:recipe_app/domain/repository/forum_data_repo.dart';

class ForumDataUsecase {
  final ForumDataRepository forumDataRepository;

  const ForumDataUsecase({required this.forumDataRepository});

  Future<List<ForumChallengesDataEntity>> getChallengesList() {
    return forumDataRepository.getChallengesList();
  }

  Future<List<ForumGroupsDataEntity>> getGroupsList() {
    return forumDataRepository.getGroupsList();
  }

  Future<List<ForumFeaturedTopicsDataEntity>> getFeaturedTopicList() {
    return forumDataRepository.getFeaturedTopicList();
  }
}
