part of 'recipe_page_bloc.dart';

sealed class RecipePageState extends Equatable {
  const RecipePageState();

  @override
  List<Object> get props => [];
}

final class RecipePageInitialState extends RecipePageState {}

final class RecipeFetchingSuccessState extends RecipePageState {
  final List<RecipeEntity> recipeList;
  final List<RecipeEntity> favoriteRecipies;

  const RecipeFetchingSuccessState(
      {required this.favoriteRecipies, required this.recipeList});
}

final class RecipeFetchingErrorState extends RecipePageState {
  final String errorMessage;

  const RecipeFetchingErrorState({required this.errorMessage});
}
