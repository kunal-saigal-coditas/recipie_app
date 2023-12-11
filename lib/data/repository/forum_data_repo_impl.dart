import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';

import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';

import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/forum_data_source.dart';
import 'package:recipe_app/domain/repository/forum_data_repo.dart';

class ForumDataRepositoryImpl implements ForumDataRepository {
  final ForumDataSource forumDataSource;

  const ForumDataRepositoryImpl({required this.forumDataSource});

  @override
  Future<List<ForumChallengesDataModel>> getChallengesList() {
    return forumDataSource.getChallengesList();
  }

  @override
  Future<List<ForumFeaturedTopicsDataModel>> getFeaturedTopicList() {
    return forumDataSource.getFeaturedTopicList();
  }

  @override
  Future<List<ForumGroupsDataModel>> getGroupsList() {
    return forumDataSource.getGroupsList();
  }
}
