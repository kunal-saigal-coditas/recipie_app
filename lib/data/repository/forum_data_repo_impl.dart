import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';

import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';

import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';
import 'package:recipe_app/data/data_source/forum_data_source.dart';

import '../../domain/repository/forum_data_repo.dart';

class ForumDataRepositoryImpl implements ForumDataRepository {
  final ForumDataSource forumDataSource;

  const ForumDataRepositoryImpl({required this.forumDataSource});

  @override
  List<ForumChallengesDataModel> getChallengesList() {
    return forumDataSource.getChallengesList();
  }

  @override
  List<ForumFeaturedTopicsDataModel> getFeaturedTopicList() {
    return forumDataSource.getFeaturedTopicList();
  }

  @override
  List<ForumGroupsDataModel> getGroupsList() {
    return forumDataSource.getGroupsList();
  }
}
