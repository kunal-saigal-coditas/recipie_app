part of 'recipe_page_bloc.dart';

sealed class RecipePageEvent extends Equatable {
  const RecipePageEvent();

  @override
  List<Object> get props => [];
}

final class RecipePageInitialEvent extends RecipePageEvent {}
