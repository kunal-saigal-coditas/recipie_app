part of 'setup_bloc.dart';

sealed class SetupState {
  const SetupState();

  // @override
  // List<Object> get props => [];
}

final class SetupInitialState extends SetupState {}

final class SetupPageLoadedState extends SetupState {
  final List<SetupDataEntity> setupPageDataList;
  final int pageIndex;
  final List<AnswerItemEntity> answerItemList;

  const SetupPageLoadedState({
    required this.setupPageDataList,
    required this.pageIndex,
    required this.answerItemList,
  });

  SetupPageLoadedState copyWith({
    int? pageIndex,
    List<SetupDataEntity>? setupPageDataList,
    List<AnswerItemEntity>? answerItemList,
  }) {
    return SetupPageLoadedState(
      pageIndex: pageIndex ?? this.pageIndex,
      setupPageDataList: setupPageDataList ?? this.setupPageDataList,
      answerItemList: answerItemList ?? this.answerItemList,
    );
  }

  // @override
  // List<Object> get props => [
  //       pageIndex,
  //       setupPageDataList,
  //       answerItemList,
  //     ];
}
