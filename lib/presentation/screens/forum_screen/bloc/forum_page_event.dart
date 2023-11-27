part of 'forum_page_bloc.dart';

sealed class ForumPageEvent extends Equatable {
  const ForumPageEvent();

  @override
  List<Object> get props => [];
}

final class ForumPageDataFetchingEvent extends ForumPageEvent {}
