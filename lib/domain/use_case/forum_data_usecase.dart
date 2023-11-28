import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';
import 'package:recipe_app/domain/repository/forum_data_repo.dart';

class ForumDataUsecase {
  final ForumDataRepository forumDataRepository;

  const ForumDataUsecase({required this.forumDataRepository});

  List<ForumChallengesDataModel> getChallengesList() {
    return forumDataRepository.getChallengesList();
  }

  List<ForumGroupsDataModel> getGroupsList() {
    return forumDataRepository.getGroupsList();
  }

  List<ForumFeaturedTopicsDataModel> getFeaturedTopicList() {
    return forumDataRepository.getFeaturedTopicList();
  }
}
