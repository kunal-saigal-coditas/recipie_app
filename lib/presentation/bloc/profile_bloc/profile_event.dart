part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class FetchProfilePageDataEvent extends ProfileEvent {
  final List<RecipeEntity> recipieList;

  const FetchProfilePageDataEvent({
    required this.recipieList,
  });
}
