part of 'profile_bloc.dart';

sealed class ProfileState {
  const ProfileState();

  // @override
  // List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileFetchingSuccessState extends ProfileState {
  final List<RecipeEntity> favoriteRecipiesList;

  const ProfileFetchingSuccessState({
    required this.favoriteRecipiesList,
  });

  ProfileFetchingSuccessState copyWith(
      {List<RecipeEntity>? favoriteRecipiesList}) {
    return ProfileFetchingSuccessState(
      favoriteRecipiesList: favoriteRecipiesList ?? this.favoriteRecipiesList,
    );
  }
}
