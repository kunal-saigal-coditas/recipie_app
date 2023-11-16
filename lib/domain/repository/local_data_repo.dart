import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

abstract class LocalDataRepository {
  List<int> getFavoritesDataList();
  Future<void> saveToFavorites(RecipeEntity recipeEntity);
}
