import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/domain/use_case/local_data_usecase.dart';

part 'setup_event.dart';
part 'setup_state.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  final LocalDataUseCase localDataUseCase;

  SetupBloc({required this.localDataUseCase})
      : super(SetupPageLoadedState(setupPageDataList: [], pageIndex: 0)) {
    on<OnNextEvent>(onNextEvent);
    on<OnPreviousEvent>(onPreviousEvent);
  }
  FutureOr<void> onNextEvent(OnNextEvent event, Emitter<SetupState> emit) {
    int index = (state as SetupPageLoadedState).pageIndex + 1;
    emit(
      (state as SetupPageLoadedState).copyWith(pageIndex: index),
    );
  }

  FutureOr<void> onPreviousEvent(
      OnPreviousEvent event, Emitter<SetupState> emit) {
    int index = (state as SetupPageLoadedState).pageIndex - 1;
    emit(
      (state as SetupPageLoadedState).copyWith(pageIndex: index),
    );
  }
}
