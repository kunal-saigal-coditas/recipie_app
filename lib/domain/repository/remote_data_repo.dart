import 'package:dartz/dartz.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../core/failure/failure.dart';

abstract class RemoteDataRepository {
  Future<Either<Failure, List<RecipeEntity>>> getDatafromDio();
}
