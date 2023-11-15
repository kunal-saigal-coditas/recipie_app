part of 'recipe_page_bloc.dart';

sealed class RecipePageEvent extends Equatable {
  const RecipePageEvent();

  @override
  List<Object> get props => [];
}

final class RecipePageInitialEvent extends RecipePageEvent {}

final class AddToFavoritesEvent extends RecipePageEvent {
  final RecipeEntity recipeEntity;
  final List<RecipeEntity> recipeList;

  const AddToFavoritesEvent({
    required this.recipeList,
    required this.recipeEntity,
  });
}
