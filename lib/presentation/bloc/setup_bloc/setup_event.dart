part of 'setup_bloc.dart';

sealed class SetupEvent extends Equatable {
  const SetupEvent();

  @override
  List<Object> get props => [];
}

final class OnNextEvent extends SetupEvent {}

final class OnPreviousEvent extends SetupEvent {}
