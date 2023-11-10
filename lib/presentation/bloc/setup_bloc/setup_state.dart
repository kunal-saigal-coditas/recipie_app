part of 'setup_bloc.dart';

sealed class SetupState extends Equatable {
  const SetupState();

  @override
  List<Object> get props => [];
}

// final class SetupInitialState extends SetupState {}

final class SetupPageLoadedState extends SetupState {
  final List<SetupDataEntity> setupPageDataList;
  final int pageIndex;

  const SetupPageLoadedState(
      {required this.setupPageDataList, required this.pageIndex});

  SetupPageLoadedState copyWith(
      {int? pageIndex, List<SetupDataEntity>? setupPageDataList}) {
    return SetupPageLoadedState(
      pageIndex: pageIndex ?? this.pageIndex,
      setupPageDataList: setupPageDataList ?? this.setupPageDataList,
    );
  }

  @override
  List<Object> get props => [
        pageIndex,
        setupPageDataList,
      ];
}
