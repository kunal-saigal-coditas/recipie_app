import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/data_source/forum_data_source.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_featured_topic_data_entity.dart';
import 'package:recipe_app/domain/entity/forum_data_entity/forum_group_data_entity.dart';

part 'forum_page_event.dart';
part 'forum_page_state.dart';

class ForumPageBloc extends Bloc<ForumPageEvent, ForumPageState> {
  final ForumDataSource forumDataSource;
  ForumPageBloc({
    required this.forumDataSource,
  }) : super(ForumPageInitial()) {
    on<ForumPageDataFetchingEvent>(forumPageDataFetch);
  }

  FutureOr<void> forumPageDataFetch(
      ForumPageDataFetchingEvent event, Emitter<ForumPageState> emit) {
    emit(
      ForumPageSuccessState(
        featuredTopicList: forumDataSource.getFeaturedTopicList(),
        challengesDataList: forumDataSource.getChallengesList(),
        groupsDataList: forumDataSource.getGroupsList(),
      ),
    );
  }
}
