import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/data/data_model/recipe_model.dart';

class RemoteDataSource {
  Future<Either<Failure, List<RecipeModel>>> getRecipeData() async {
    final FirebaseFirestore firestore = GetIt.I<FirebaseFirestore>();

    List<RecipeModel> recipeList = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('recipeCollection').get();

      recipeList = snapshot.docs.map(
        (doc) {
          final data = doc.data();
          return RecipeModel.fromJson(data);
        },
      ).toList();
      return Right(recipeList);
    } catch (error) {
      return Left(
        Failure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
