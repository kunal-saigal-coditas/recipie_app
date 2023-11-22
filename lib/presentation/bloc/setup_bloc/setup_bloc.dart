import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/domain/use_case/setup_data_use_case.dart';

part 'setup_event.dart';
part 'setup_state.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  final SetupDataUseCase setupDataUseCase;

  SetupBloc({
    required this.setupDataUseCase,
  }) : super(
          SetupInitialState(),
        ) {
    on<SetupInitialEvent>(setupInitial);
    on<OnNextEvent>(onNext);
    on<OnPreviousEvent>(onPrevious);
    on<OnSelectEvent>(onSelect);
  }
  FutureOr<void> onNext(OnNextEvent event, Emitter<SetupState> emit) {
    int index = (state as SetupPageLoadedState).pageIndex + 1;
    emit(
      (state as SetupPageLoadedState).copyWith(
        pageIndex: index,
        answerItemList: setupDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> onPrevious(OnPreviousEvent event, Emitter<SetupState> emit) {
    int index = (state as SetupPageLoadedState).pageIndex - 1;
    emit(
      (state as SetupPageLoadedState).copyWith(
        pageIndex: index,
        answerItemList: setupDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> setupInitial(
      SetupInitialEvent event, Emitter<SetupState> emit) {
    int index = 0;
    emit(
      SetupPageLoadedState(
        setupPageDataList: setupDataUseCase.getSetupDataList(),
        pageIndex: index,
        answerItemList: setupDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> onSelect(OnSelectEvent event, Emitter<SetupState> emit) {
    AnswerItemEntity updatedAnswerItem = event.answerItemEntity;
    updatedAnswerItem.isSelected = !updatedAnswerItem.isSelected;
    List<AnswerItemEntity> updatedAnswerList = [...event.answerItemList];
    int index = updatedAnswerList.indexWhere(
      (element) => element.id == updatedAnswerItem.id,
    );
    updatedAnswerList[index] = updatedAnswerItem;

    emit(
      (state as SetupPageLoadedState).copyWith(
        answerItemList: updatedAnswerList,
      ),
    );
    // updatedAnswerList = [];
  }
}
