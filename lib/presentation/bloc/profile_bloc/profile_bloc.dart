import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/data_source/local_data_source.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
// import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // final RecipePageBloc recipePageBloc;
  final LocalDataSource localDataSource;
  ProfileBloc({required this.localDataSource}
      // {required this.recipePageBloc}
      )
      : super(ProfileInitial()) {
    List<RecipeEntity> favorites;
    List<int> favoritesIdList = localDataSource.getFavoritesDataList();
    on<FetchProfilePageDataEvent>(fetchProfilePageDataEvent);
  }

  FutureOr<void> fetchProfilePageDataEvent(
      FetchProfilePageDataEvent event, Emitter<ProfileState> emit) {
    emit(
      const ProfileFetchingSuccessState(
          // recipeList: event.favoriteRecipies,
          ),
    );
  }
}
