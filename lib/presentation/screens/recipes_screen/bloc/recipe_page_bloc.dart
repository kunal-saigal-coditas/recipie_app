import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/use_case/recipe_usecase.dart';

part 'recipie_page_event.dart';
part 'recipe_page_state.dart';

class RecipePageBloc extends Bloc<RecipePageEvent, RecipePageState> {
  final RecipeUsecase recipeDataUsecase;
  RecipePageBloc({
    required this.recipeDataUsecase,
  }) : super(RecipePageInitialState()) {
    on<RecipePageInitialEvent>(recipeFetching);
    on<AddToFavoritesEvent>(addToFavorites);
  }

  FutureOr<void> recipeFetching(
      RecipePageInitialEvent event, Emitter<RecipePageState> emit) async {
    Either<Failure, List<RecipeEntity>> response =
        await recipeDataUsecase.getRecipeData();
    List<int> favoritesList = recipeDataUsecase.getFavoritesDataList();

    response.fold((left) {
      emit(
        const RecipeFetchingErrorState(
          errorMessage: "right.errorMessage",
        ),
      );
    }, (right) {
      List<RecipeEntity> recipeList = right;

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
    List<RecipeEntity> recipeListCopy =
        (state as RecipeFetchingSuccessState).recipeList;

    int index = recipeListCopy.indexWhere(
      (recipe) => recipe.id == event.recipeEntity.id,
    );
    RecipeEntity postToUpdate = recipeListCopy[index];
    postToUpdate = postToUpdate.copyWith(
      isFavorite: !postToUpdate.isFavorite,
    );

    recipeListCopy[index] = postToUpdate;

    recipeDataUsecase.saveToFavorites(event.recipeEntity);

    emit(
      (state as RecipeFetchingSuccessState).copyWith(
        recipeList: recipeListCopy,
      ),
    );
  }
}
