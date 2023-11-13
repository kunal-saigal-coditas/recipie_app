import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/test_data.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';

import '../../../core/failure/failure.dart';

part 'recipie_page_event.dart';
part 'recipe_page_state.dart';

class RecipePageBloc extends Bloc<RecipePageEvent, RecipePageState> {
  final RemoteDataUseCase remoteDataUsecase;
  RecipePageBloc({required this.remoteDataUsecase})
      : super(RecipePageInitialState()) {
    on<RecipePageInitialEvent>(recipeFetching);
  }

  FutureOr<void> recipeFetching(
      RecipePageInitialEvent event, Emitter<RecipePageState> emit) async {
    // Either<List<RecipeEntity>, Failure> response =
    //     await remoteDataUsecase.getDatafromDio();
    // response.fold((left) {
    emit(
      RecipeFetchingSuccessState(
        recipeList: demoRecipeList,
      ),
    );
//     }, (right) {
//       emit(
//         RecipeFetchingErrorState(
//           errorMessage: "right.errorMessage",
//         ),
//       );
//     });
  }
}
