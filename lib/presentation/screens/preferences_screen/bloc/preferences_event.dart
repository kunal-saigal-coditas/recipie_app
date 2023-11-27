part of 'preferences_bloc.dart';

sealed class PreferencesEvent {
  const PreferencesEvent();
}

final class PreferencesInitialEvent extends PreferencesEvent {}

final class OnNextEvent extends PreferencesEvent {}

final class OnPreviousEvent extends PreferencesEvent {}

final class OnSelectEvent extends PreferencesEvent {
  final AnswerItemEntity answerItemEntity;
  final List<AnswerItemEntity> answerItemList;

  const OnSelectEvent({
    required this.answerItemEntity,
    required this.answerItemList,
  });
}
