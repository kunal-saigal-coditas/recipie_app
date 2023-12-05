import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';
import 'package:recipe_app/domain/use_case/forum_data_usecase.dart';

part 'forum_page_event.dart';
part 'forum_page_state.dart';

class ForumPageBloc extends Bloc<ForumPageEvent, ForumPageState> {
  final ForumDataUsecase forumDataUsecase;

  ForumPageBloc({
    required this.forumDataUsecase,
  }) : super(ForumPageInitial()) {
    on<ForumPageDataFetchingEvent>(forumPageDataFetch);
  }

  FutureOr<void> forumPageDataFetch(
      ForumPageDataFetchingEvent event, Emitter<ForumPageState> emit) async {
    List<ForumFeaturedTopicsDataEntity> featuredTopicList =
        await forumDataUsecase.getFeaturedTopicList();
    List<ForumChallengesDataEntity> challengesDataList =
        await forumDataUsecase.getChallengesList();
    List<ForumGroupsDataEntity> groupsDataList =
        await forumDataUsecase.getGroupsList();

    emit(
      ForumPageSuccessState(
        featuredTopicList: featuredTopicList,
        challengesDataList: challengesDataList,
        groupsDataList: groupsDataList,
      ),
    );
  }
}
