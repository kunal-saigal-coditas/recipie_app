import 'package:recipe_app/data/data_source/local_data_source.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';

class LocalDataRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localDataSource;

  LocalDataRepositoryImpl({
    required this.localDataSource,
  });

  @override
  List<int> getFavoritesDataList() {
    return localDataSource.getFavoritesDataList();
  }

  @override
  Future<void> saveToFavorites(RecipeEntity recipeEntity) {
    return localDataSource.saveToFavorites(recipeEntity);
  }
}
