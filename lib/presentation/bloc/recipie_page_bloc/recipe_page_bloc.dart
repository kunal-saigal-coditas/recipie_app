import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/use_case/local_data_usecase.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';

import '../../../core/failure/failure.dart';

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
    Either<List<RecipeEntity>, Failure> response =
        await remoteDataUsecase.getDatafromDio();
    response.fold((left) {
      emit(
        RecipeFetchingSuccessState(recipeList: left, favoriteRecipies: []),
      );
    }, (right) {
      emit(
        const RecipeFetchingErrorState(
          errorMessage: "right.errorMessage",
        ),
      );
    });
  }

  FutureOr<void> addToFavorites(
      AddToFavoritesEvent event, Emitter<RecipePageState> emit) {
    List<int> favoritesIDList = localDataUseCase.getFavoritesDataList();
    RecipeEntity currentRecipe = event.recipeEntity;
    List<RecipeEntity> recipeListCopy = [...event.recipeList];
    for (RecipeEntity recipe in recipeListCopy) {
      if (favoritesIDList.contains(recipe.id)) {
        favoritesIDList.remove(
          favoritesIDList[recipeListCopy
              .indexWhere((element) => element.id == currentRecipe.id)],
        );

        // recipe = recipe.copyWith(isFavorite: false);
      } else {
        favoritesIDList.add(recipe.id);
      }
    }
    recipeListCopy.map((entity) {
      if (entity.id == currentRecipe.id) {
        return entity.copyWith(isFavorite: !currentRecipe.isFavorite);
      }
    }).toList();

    localDataUseCase.saveToFavorites(favoritesIDList);
    emit(
      (state as RecipeFetchingSuccessState).copyWith(
        recipeList: recipeListCopy,
      ),
    );
  }

  bool containsProduct(List<RecipeEntity> list1, RecipeEntity item) {
    Iterable<RecipeEntity> var1 =
        list1.where((element) => element.id == item.id);
    if (var1.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
