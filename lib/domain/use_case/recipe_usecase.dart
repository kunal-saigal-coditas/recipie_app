import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';

class RecipeUsecase {
  final RemoteDataRepository remoteDataRepository;
  final LocalDataRepository localDataRepository;

  RecipeUsecase({
    required this.remoteDataRepository,
    required this.localDataRepository,
  });

  Future<void> saveToFavorites(RecipeEntity recipeEntity) {
    return localDataRepository.saveToFavorites(recipeEntity);
  }

  List<int> getFavoritesDataList() {
    return localDataRepository.getFavoritesDataList();
  }

  Future<Either<Failure, List<RecipeEntity>>> getRecipeData() {
    return remoteDataRepository.getRecipeData();
  }
}
