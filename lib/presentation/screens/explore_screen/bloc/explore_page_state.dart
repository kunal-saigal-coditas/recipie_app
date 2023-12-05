part of 'explore_page_bloc.dart';

sealed class ExplorePageState {
  const ExplorePageState();
}

final class ExplorePageInitial extends ExplorePageState {}

final class ExplorePageSuccessState extends ExplorePageState {
  final List<ExploreDataEntity> exploreDataList;

  const ExplorePageSuccessState({required this.exploreDataList});
}
