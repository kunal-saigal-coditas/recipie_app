import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfilePageData>(fetchProfilePageData);
  }

  FutureOr<void> fetchProfilePageData(
      FetchProfilePageData event, Emitter<ProfileState> emit) {
    emit(
      const ProfileFetchingSuccessState(recipeList: []),
    );
  }
}
