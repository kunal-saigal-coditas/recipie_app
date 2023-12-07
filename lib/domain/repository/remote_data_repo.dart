import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

abstract class RemoteDataRepository {
  Future<Either<Failure, List<RecipeEntity>>> getRecipeData();
}
