import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference<Map<String, dynamic>> exploreCollection =
      FirebaseFirestore.instance.collection("exploreCollection");

  Future setExplore() async {
    String jsonString = await rootBundle.loadString("assets/explore_data.json");

    final List<dynamic> exploreList = jsonDecode(jsonString);
    for (var exploreMap in exploreList) {
      await exploreCollection.add(exploreMap);
    }
  }
}
