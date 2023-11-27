part of 'preferences_bloc.dart';

sealed class PreferencesState {
  const PreferencesState();
}

final class PreferencesInitialState extends PreferencesState {}

final class PreferencesLoadedState extends PreferencesState {
  final List<PreferencesDataEntity> preferencesDataList;
  final int pageIndex;
  final List<AnswerItemEntity> answerItemList;

  const PreferencesLoadedState({
    required this.preferencesDataList,
    required this.pageIndex,
    required this.answerItemList,
  });

  PreferencesLoadedState copyWith({
    int? pageIndex,
    List<PreferencesDataEntity>? preferencesDataList,
    List<AnswerItemEntity>? answerItemList,
  }) {
    return PreferencesLoadedState(
      pageIndex: pageIndex ?? this.pageIndex,
      preferencesDataList: preferencesDataList ?? this.preferencesDataList,
      answerItemList: answerItemList ?? this.answerItemList,
    );
  }
}
