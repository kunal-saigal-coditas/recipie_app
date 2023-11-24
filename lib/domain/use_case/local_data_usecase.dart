import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';

class LocalDataUseCase {
  final LocalDataRepository localDataRepository;

  LocalDataUseCase({
    required this.localDataRepository,
  });

  List<int> getFavoritesDataList() {
    return localDataRepository.getFavoritesDataList();
  }

  Future<void> saveToFavorites(RecipeEntity recipeEntity) {
    return localDataRepository.saveToFavorites(recipeEntity);
  }
}
