import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setup_bloc_event.dart';
part 'setup_bloc_state.dart';

class SetupBloc extends Bloc<SetupBlocEvent, SetupState> {
  SetupBloc() : super(const SetupPageLoadedState(pageIndex: 0)) {
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
