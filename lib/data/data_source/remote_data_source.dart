import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/data/data_model/recipe_model.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../core/failure/failure.dart';

class RemoteDataSource {
  String apiKey = "9100c515f01e4a078bc41ce7b75e532d";
  String baseUrl = "https://api.spoonacular.com";
  List<RecipeEntity> recipeList = [];
  Future<Either<List<RecipeEntity>, Failure>> getDatafromDio() async {
    Dio dio = Dio();
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onResponse: (response, h) {
    //       for (Map m in response.data) {
    //         recipeList.add(
    //           RecipeModel.fromJson(m as Map<String, dynamic>),
    //         );
    //       }
    //       return h.next(response);
    //     },
    //   ),
    // );

    try {
      Response response = await dio.get(
          "$baseUrl/recipes/informationBulk/?apiKey=$apiKey&ids=715538,716429");

      if (response.statusCode == 200) {
        for (Map m in response.data) {
          recipeList.add(
            RecipeModel.fromJson(m as Map<String, dynamic>),
          );
        }
        print(response.statusCode);
        return Left(recipeList);
      } else {
        return const Left([]);
      }
    } catch (e) {
      return Right(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
