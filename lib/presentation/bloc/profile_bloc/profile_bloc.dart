import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/data_source/local_data_source.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RecipePageBloc recipePageBloc;
  final LocalDataSource localDataSource;
  late StreamSubscription streamSubscription;
  ProfileBloc({required this.localDataSource, required this.recipePageBloc})
      : super(ProfileInitial()) {
    streamSubscription = recipePageBloc.stream.listen((recipePageState) {
      if (state is RecipeFetchingSuccessState) {
        add(
          FetchProfilePageDataEvent(
            recipieList: (state as RecipeFetchingSuccessState).recipeList,
          ),
        );
      }
    });
    on<FetchProfilePageDataEvent>(fetchProfilePageDataEvent);
  }

  FutureOr<void> fetchProfilePageDataEvent(
      FetchProfilePageDataEvent event, Emitter<ProfileState> emit) {
    List<int> favoriteIdList = localDataSource.getFavoritesDataList();
    List<RecipeEntity> recipeList = event.recipieList;
    List<RecipeEntity> favoritesList = [];
    for (int i in favoriteIdList) {
      recipeList.map((element) {
        if (element.id == i) {
          favoritesList.add(element);
        }
      }).toList();
    }
    emit(
      ProfileFetchingSuccessState(favoriteRecipiesList: favoritesList),
    );
  }
}
