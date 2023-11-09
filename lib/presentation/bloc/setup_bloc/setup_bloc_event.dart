part of 'setup_bloc.dart';

sealed class SetupBlocEvent extends Equatable {
  const SetupBlocEvent();

  @override
  List<Object> get props => [];
}

final class OnNextEvent extends SetupBlocEvent {}

final class OnPreviousEvent extends SetupBlocEvent {}
