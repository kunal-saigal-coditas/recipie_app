import 'dart:convert';

import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/data/data_model/recipe_model.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class RemoteDataSource {
  // String apiKey = "f30258e7873345b493fa25a23ed84702";
  // String baseUrl = "https://api.spoonacular.com";
  Future<Either<Failure, List<RecipeEntity>>> getDatafromDio() async {
    List<RecipeEntity> recipeList = [];
    // Dio dio = Dio();
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
      // Response response = await dio.get(
      //   "$baseUrl/recipes/informationBulk/?apiKey=$apiKey&ids=1,2,3,4,5,6,7,8,9,10",
      // );

      // if (response.statusCode == 200) {
      //   for (Map m in response.data) {
      //     recipeList.add(
      //       RecipeModel.fromJson(m as Map<String, dynamic>),
      //     );
      //   }
      //   print(response.statusCode);
      //   return Left(recipeList);
      // } else {
      String data = await rootBundle.loadString("assets/mock_data.json");
      final jsonResult = jsonDecode(data);
      for (Map m in jsonResult) {
        recipeList.add(
          RecipeModel.fromJson(m as Map<String, dynamic>),
        );
      }
      return Right(recipeList);
      // }
    } catch (error) {
      return Left(
        Failure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
