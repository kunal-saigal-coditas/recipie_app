part of 'setup_bloc.dart';

sealed class SetupEvent {
  const SetupEvent();
}

final class SetupInitialEvent extends SetupEvent {}

final class OnNextEvent extends SetupEvent {}

final class OnPreviousEvent extends SetupEvent {}

final class OnSelectEvent extends SetupEvent {
  final AnswerItemEntity answerItemEntity;
  final List<AnswerItemEntity> answerItemList;

  const OnSelectEvent({
    required this.answerItemEntity,
    required this.answerItemList,
  });
}
