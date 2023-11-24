import 'package:dartz/dartz.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../core/failure/failure.dart';
import '../repository/remote_data_repo.dart';

class RemoteDataUseCase {
  final RemoteDataRepository remoteDataRepository;

  RemoteDataUseCase({
    required this.remoteDataRepository,
  });

  Future<Either<Failure, List<RecipeEntity>>> getDatafromDio() {
    return remoteDataRepository.getDatafromDio();
  }
}
