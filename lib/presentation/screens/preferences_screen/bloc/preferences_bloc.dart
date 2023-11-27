import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../domain/entity/preferences_data_entity/preferences_data_entity.dart';
import '../../../../domain/use_case/preferences_data_use_case.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesDataUseCase preferencesDataUseCase;

  PreferencesBloc({
    required this.preferencesDataUseCase,
  }) : super(
          PreferencesInitialState(),
        ) {
    on<PreferencesInitialEvent>(preferencesInitial);
    on<OnNextEvent>(onNext);
    on<OnPreviousEvent>(onPrevious);
    on<OnSelectEvent>(onSelect);
  }
  FutureOr<void> onNext(OnNextEvent event, Emitter<PreferencesState> emit) {
    int index = (state as PreferencesLoadedState).pageIndex + 1;
    emit(
      (state as PreferencesLoadedState).copyWith(
        pageIndex: index,
        answerItemList: preferencesDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> onPrevious(
      OnPreviousEvent event, Emitter<PreferencesState> emit) {
    int index = (state as PreferencesLoadedState).pageIndex - 1;
    emit(
      (state as PreferencesLoadedState).copyWith(
        pageIndex: index,
        answerItemList: preferencesDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> preferencesInitial(
      PreferencesInitialEvent event, Emitter<PreferencesState> emit) {
    int index = 0;
    emit(
      PreferencesLoadedState(
        preferencesDataList: preferencesDataUseCase.getPreferencesDataList(),
        pageIndex: index,
        answerItemList: preferencesDataUseCase.getAnswerList()[index],
      ),
    );
  }

  FutureOr<void> onSelect(OnSelectEvent event, Emitter<PreferencesState> emit) {
    AnswerItemEntity updatedAnswerItem = event.answerItemEntity;
    updatedAnswerItem.isSelected = !updatedAnswerItem.isSelected;

    List<AnswerItemEntity> updatedAnswerList = [...event.answerItemList];
    if ((state as PreferencesLoadedState).pageIndex == 0 ||
        (state as PreferencesLoadedState).pageIndex == 4) {
      for (AnswerItemEntity entity in updatedAnswerList) {
        entity.isSelected = (identical(
          entity,
          updatedAnswerItem,
        ));
      }
    }

    int index = updatedAnswerList.indexWhere(
      (element) => element.id == updatedAnswerItem.id,
    );

    updatedAnswerList[index] = updatedAnswerItem;

    emit(
      (state as PreferencesLoadedState).copyWith(
        answerItemList: updatedAnswerList,
      ),
    );
  }
}
