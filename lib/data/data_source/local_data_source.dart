import 'dart:convert';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  late SharedPreferences sharedPreferenceInstance;
  Future<void> init() async {
    sharedPreferenceInstance = await SharedPreferences.getInstance();
  }

  Future<void> saveToFavorites(List<int> favoritesList) async {
    // List<int> favoritesList = getFavoritesDataList();
    // if (favoritesList.isEmpty) {
    //   favoritesList.add(id);
    // } else {
    //   if (favoritesList.contains(id)) {
    //     favoritesList.remove(id);
    //   } else {
    //     favoritesList.add(id);
    //   }
    // }
    String saveList = jsonEncode(favoritesList);
    await sharedPreferenceInstance.setString(
      StringConstants.ksharedPreferencekey,
      saveList,
    );
  }

  List<int> getFavoritesDataList() {
    final String savedFavoritesList = sharedPreferenceInstance
            .getString(StringConstants.ksharedPreferencekey) ??
        "";
    if (savedFavoritesList != "") {
      var decodedFavoriteList = jsonDecode(savedFavoritesList);

      // Use the "is List" check to ensure the decoded object is a list
      List<int> result = decodedFavoriteList.cast<int>();
      return result;
    } else {
      return [];
    }
  }
}
