import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class LocalDataSource {
  late SharedPreferences sharedPreferenceInstance;
  Future<void> init() async {
    sharedPreferenceInstance = await SharedPreferences.getInstance();
  }

  Future<void> saveToFavorites(RecipeEntity currentRecipe) async {
    List<int> favoritesList = getFavoritesDataList();
    if (favoritesList.isEmpty) {
      favoritesList.add(currentRecipe.id);
    } else {
      if (favoritesList.contains(currentRecipe.id)) {
        favoritesList.remove(currentRecipe.id);
      } else {
        favoritesList.add(currentRecipe.id);
      }
    }
    String saveList = jsonEncode(favoritesList);
    await sharedPreferenceInstance.setString(
      StringConstants.ksharedPreferenceKeyText,
      saveList,
    );
  }

  List<int> getFavoritesDataList() {
    final String savedFavoritesList = sharedPreferenceInstance
            .getString(StringConstants.ksharedPreferenceKeyText) ??
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
