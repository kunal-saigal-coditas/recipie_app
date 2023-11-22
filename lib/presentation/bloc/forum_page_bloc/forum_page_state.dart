part of 'forum_page_bloc.dart';

sealed class ForumPageState extends Equatable {
  const ForumPageState();

  @override
  List<Object> get props => [];
}

final class ForumPageInitial extends ForumPageState {}

final class ForumPageSuccessState extends ForumPageState {
  final List<ForumFeaturedTopicsDataEntity> featuredTopicList;
  final List<ForumChallengesDataEntity> challengesDataList;
  final List<ForumGroupsDataEntity> groupsDataList;

  const ForumPageSuccessState({
    required this.featuredTopicList,
    required this.challengesDataList,
    required this.groupsDataList,
  });
}
