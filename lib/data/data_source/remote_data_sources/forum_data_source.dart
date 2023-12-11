import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';

class ForumDataSource {
  final FirebaseFirestore _firestore = GetIt.I<FirebaseFirestore>();

  Future<List<ForumFeaturedTopicsDataModel>> getFeaturedTopicList() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('forumFeaturedTopicsCollection').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ForumFeaturedTopicsDataModel.fromJson(data);
    }).toList();
  }

  Future<List<ForumChallengesDataModel>> getChallengesList() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('forumChallengesCollection').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ForumChallengesDataModel.fromJson(data);
    }).toList();
  }

  Future<List<ForumGroupsDataModel>> getGroupsList() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('forumGroupsCollection').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ForumGroupsDataModel.fromJson(data);
    }).toList();
  }
}
