import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RecipePageBloc recipePageBloc;
  late StreamSubscription streamSubscription;
  ProfileBloc(this.recipePageBloc) : super(ProfileInitial()) {
    List<RecipeEntity> favorites;
    streamSubscription = recipePageBloc.stream.listen((recipePageState) {
      if (recipePageState is RecipeFetchingSuccessState) {
        favorites = recipePageState.favoriteRecipies;
        add(
          FetchProfilePageData(favoriteRecipies: favorites),
        );
      }
    });
    on<FetchProfilePageData>(fetchProfilePageData);
  }

  FutureOr<void> fetchProfilePageData(
      FetchProfilePageData event, Emitter<ProfileState> emit) {
    emit(
      ProfileFetchingSuccessState(recipeList: event.favoriteRecipies),
    );
  }
}
