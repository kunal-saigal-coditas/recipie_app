part of 'recipe_page_bloc.dart';

sealed class RecipePageState {
  const RecipePageState();
}

final class RecipePageInitialState extends RecipePageState {}

final class RecipeFetchingSuccessState extends RecipePageState {
  final List<RecipeEntity> recipeList;
  final List<RecipeEntity> favoriteRecipies;

  const RecipeFetchingSuccessState({
    required this.favoriteRecipies,
    required this.recipeList,
  });

  RecipeFetchingSuccessState copyWith({
    List<RecipeEntity>? recipeList,
    List<RecipeEntity>? favoriteRecipies,
  }) {
    return RecipeFetchingSuccessState(
      favoriteRecipies: favoriteRecipies ?? this.favoriteRecipies,
      recipeList: recipeList ?? this.recipeList,
    );
  }
}

final class RecipeFetchingErrorState extends RecipePageState {
  final String errorMessage;

  const RecipeFetchingErrorState({required this.errorMessage});
}
