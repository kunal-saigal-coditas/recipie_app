import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/failure/failure.dart';

import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';
import 'package:recipe_app/domain/use_case/local_data_usecase.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/bloc/recipe_page_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RecipePageBloc recipePageBloc;
  final LocalDataUseCase localDataUseCase;
  final RemoteDataUseCase remoteDataUseCase;
  late StreamSubscription streamSubscription;
  ProfileBloc({
    required this.localDataUseCase,
    required this.remoteDataUseCase,
    required this.recipePageBloc,
  }) : super(ProfileInitial()) {
    streamSubscription = recipePageBloc.stream.listen((recipePageState) {
      if (recipePageState is RecipeFetchingSuccessState) {
        add(
          FetchProfilePageDataEvent(),
        );
      }
    });
    on<FetchProfilePageDataEvent>(fetchProfilePageDataEvent);
  }

  FutureOr<void> fetchProfilePageDataEvent(
      FetchProfilePageDataEvent event, Emitter<ProfileState> emit) async {
    List<int> favoriteIdList = localDataUseCase.getFavoritesDataList();
    List<RecipeEntity> recipeList = [];
    Either<Failure, List<RecipeEntity>> response =
        await remoteDataUseCase.getDatafromDio();

    response.fold((left) {
      recipeList = [];
    }, (right) {
      recipeList = right;
    });

    List<RecipeEntity> favoritesList = [];

    favoritesList = recipeList
        .where(
          (element) => favoriteIdList.contains(element.id),
        )
        .toList();
    emit(
      ProfileFetchingSuccessState(
        favoriteRecipiesList: favoritesList,
      ),
    );
  }
}
