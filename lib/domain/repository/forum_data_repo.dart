import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';

abstract class ForumDataRepository {
  List<ForumChallengesDataModel> getChallengesList();

  List<ForumGroupsDataModel> getGroupsList();

  List<ForumFeaturedTopicsDataModel> getFeaturedTopicList();
}
