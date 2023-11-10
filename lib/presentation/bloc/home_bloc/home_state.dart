part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class RecipeFetchingSuccessState extends HomeState {
  final List<RecipeEntity> recipeList;

  const RecipeFetchingSuccessState({required this.recipeList});
}