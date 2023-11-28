import 'package:dartz/dartz.dart';

import 'package:recipe_app/core/failure/failure.dart';
import 'package:recipe_app/data/data_source/remote_data_source/remote_data_source.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  final RemoteDataSource remoteDataSource;

  RemoteDataRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<RecipeEntity>>> getDatafromDio() {
    return remoteDataSource.getDatafromDio();
  }
}
