part of 'setup_bloc.dart';

sealed class SetupState extends Equatable {
  const SetupState();

  @override
  List<Object> get props => [];
}

final class SetupPageLoadedState extends SetupState {
  final int pageIndex;

  const SetupPageLoadedState({required this.pageIndex});

  SetupPageLoadedState copyWith({int? pageIndex}) {
    return SetupPageLoadedState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object> get props => [pageIndex];
}
