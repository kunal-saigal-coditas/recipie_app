import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

import 'package:recipe_app/core/failure/failure.dart';
import 'package:recipe_app/data/data_model/recipe_model.dart';

import 'package:recipe_app/data/data_source/remote_data_sources/remote_data_source.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  final RemoteDataSource remoteDataSource;

  RemoteDataRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<RecipeEntity>>> getRecipeData() async {
    Either<Failure, List<RecipeModel>> response =
        await remoteDataSource.getRecipeData();
    return response.fold(
      (error) => Left(
        Failure(
          errorMessage: StringConstants.kerrorMessage,
        ),
      ),
      (recipeList) => Right(
        recipeList
            .map(
              (model) => model.toEntity(),
            )
            .toList(),
      ),
    );
  }
}
