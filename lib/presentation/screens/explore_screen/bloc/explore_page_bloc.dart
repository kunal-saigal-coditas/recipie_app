import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:recipe_app/domain/entity/explore_data_entity/explore_data_entity.dart';
import 'package:recipe_app/domain/use_case/explore_data_usecase.dart';

part 'explore_page_event.dart';
part 'explore_page_state.dart';

class ExplorePageBloc extends Bloc<ExplorePageEvent, ExplorePageState> {
  final ExploreDataUsecase exploreDataUsecase;

  ExplorePageBloc({required this.exploreDataUsecase})
      : super(ExplorePageInitial()) {
    on<FetchExplorePageDataEvent>(fetchExplorePageData);
  }

  FutureOr<void> fetchExplorePageData(
      FetchExplorePageDataEvent event, Emitter<ExplorePageState> emit) async {
    List<ExploreDataEntity> exploreDataList =
        await exploreDataUsecase.getExplorePageData();

    emit(
      ExplorePageSuccessState(
        exploreDataList: exploreDataList,
      ),
    );
  }
}
