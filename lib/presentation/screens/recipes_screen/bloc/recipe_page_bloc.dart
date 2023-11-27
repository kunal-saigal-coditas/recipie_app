import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/use_case/local_data_usecase.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';

part 'recipie_page_event.dart';
part 'recipe_page_state.dart';

class RecipePageBloc extends Bloc<RecipePageEvent, RecipePageState> {
  final RemoteDataUseCase remoteDataUsecase;
  final LocalDataUseCase localDataUseCase;
  RecipePageBloc({
    required this.remoteDataUsecase,
    required this.localDataUseCase,
  }) : super(RecipePageInitialState()) {
    on<RecipePageInitialEvent>(recipeFetching);
    on<AddToFavoritesEvent>(addToFavorites);
  }

  FutureOr<void> recipeFetching(
      RecipePageInitialEvent event, Emitter<RecipePageState> emit) async {
    Either<Failure, List<RecipeEntity>> response =
        await remoteDataUsecase.getDatafromDio();
    List<int> favoritesList = localDataUseCase.getFavoritesDataList();
    response.fold((left) {
      emit(
        const RecipeFetchingErrorState(
          errorMessage: "right.errorMessage",
        ),
      );
    }, (right) {
      List<RecipeEntity> recipeList = [...right];
      for (int i = 0; i < recipeList.length; i++) {
        if (favoritesList.contains(recipeList[i].id)) {
          recipeList[i] = recipeList[i].copyWith(
            isFavorite: true,
          );
        }
      }
      emit(
        RecipeFetchingSuccessState(
          recipeList: recipeList,
          favoriteRecipies: const [],
        ),
      );
    });
  }

  FutureOr<void> addToFavorites(
      AddToFavoritesEvent event, Emitter<RecipePageState> emit) {
    int index = (event.recipeEntity.id - 1);

    List<RecipeEntity> recipeListCopy =
        List.from((state as RecipeFetchingSuccessState).recipeList);
    RecipeEntity postToUpdate = recipeListCopy[index];
    postToUpdate = postToUpdate.copyWith(
      isFavorite: !postToUpdate.isFavorite,
    );

    recipeListCopy[index] = postToUpdate;

    localDataUseCase.saveToFavorites(event.recipeEntity);

    emit(
      (state as RecipeFetchingSuccessState).copyWith(
        recipeList: recipeListCopy,
      ),
    );
  }
}
