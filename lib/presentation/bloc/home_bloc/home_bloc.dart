import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/data_source/remote_data_source.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RemoteDataSource remoteDataSource;
  HomeBloc(this.remoteDataSource) : super(HomeInitial()) {
    on<HomeInitialEvent>(recipeFetching);
  }

  FutureOr<void> recipeFetching(
      HomeInitialEvent event, Emitter<HomeState> emit) {}
}
