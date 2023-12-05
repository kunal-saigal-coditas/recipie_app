part of 'explore_page_bloc.dart';

sealed class ExplorePageEvent {
  const ExplorePageEvent();
}

class FetchExplorePageDataEvent extends ExplorePageEvent {}
