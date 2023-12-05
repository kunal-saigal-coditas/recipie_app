import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference<Map<String, dynamic>> recipeCollection =
      FirebaseFirestore.instance.collection("recipesCollection");
  Future setRecipeData() async {
    String jsonString = await rootBundle.loadString("assets/mock_data.json");

    final List<dynamic> recipeList = jsonDecode(jsonString);

    for (var recipeMap in recipeList) {
      await recipeCollection.add(recipeMap);
    }
  }

  final CollectionReference<Map<String, dynamic>> exploreCollection =
      FirebaseFirestore.instance.collection("exploreCollection");
  Future setExploreData() async {
    String jsonString = await rootBundle.loadString("assets/explore_data.json");

    final List<dynamic> exploreList = jsonDecode(jsonString);

    for (var exploreMap in exploreList) {
      await exploreCollection.add(exploreMap);
    }
  }

  final CollectionReference<Map<String, dynamic>> preferencesCollection =
      FirebaseFirestore.instance.collection("preferencesCollection");
  Future setPreferencesData() async {
    String jsonString =
        await rootBundle.loadString("assets/preferences_data.json");

    final List<dynamic> preferencesList = jsonDecode(jsonString);

    for (int i = 0; i < preferencesList.length; i++) {
      Map<String, dynamic> preferencesMap = preferencesList[i];
      preferencesMap['index'] = i; // Add the order field
      await preferencesCollection.add(preferencesMap);
    }
  }

  final CollectionReference<Map<String, dynamic>> groceryCollection =
      FirebaseFirestore.instance.collection("groceryCollection");
  Future setGroceryData() async {
    String jsonString = await rootBundle.loadString("assets/grocery_data.json");

    final List<dynamic> groceryList = jsonDecode(jsonString);

    for (var groceryMap in groceryList) {
      await groceryCollection.add(groceryMap);
    }
  }

  final CollectionReference<Map<String, dynamic>>
      forumFeaturedTopicsCollection =
      FirebaseFirestore.instance.collection("forumFeaturedTopicsCollection");

  Future setForumFeaturedTopicsData() async {
    String jsonString =
        await rootBundle.loadString("assets/forum_featured_topics_data.json");

    final List<dynamic> forumFeaturedTopicsList = jsonDecode(jsonString);

    for (var forumFeaturedTopicsMap in forumFeaturedTopicsList) {
      await forumFeaturedTopicsCollection.add(forumFeaturedTopicsMap);
    }
  }

  final CollectionReference<Map<String, dynamic>> forumChallengesCollection =
      FirebaseFirestore.instance.collection("forumChallengesCollection");

  Future setForumChallengesData() async {
    String jsonString =
        await rootBundle.loadString("assets/forum_challenges_data.json");

    final List<dynamic> forumChallengesList = jsonDecode(jsonString);

    for (var forumChallengesMap in forumChallengesList) {
      await forumChallengesCollection.add(forumChallengesMap);
    }
  }

  final CollectionReference<Map<String, dynamic>> forumGroupsCollection =
      FirebaseFirestore.instance.collection("forumGroupsCollection");

  Future setForumGroupsData() async {
    String jsonString =
        await rootBundle.loadString("assets/forum_groups_data.json");

    final List<dynamic> forumGroupsList = jsonDecode(jsonString);

    for (var forumGroupsMap in forumGroupsList) {
      await forumGroupsCollection.add(forumGroupsMap);
    }
  }
}
