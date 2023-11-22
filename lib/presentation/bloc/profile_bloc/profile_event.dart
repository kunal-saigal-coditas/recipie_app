part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();

  // @override
  // List<Object> get props => [];
}

final class FetchProfilePageDataEvent extends ProfileEvent {}
