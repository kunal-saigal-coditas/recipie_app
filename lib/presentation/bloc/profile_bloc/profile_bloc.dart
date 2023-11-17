import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

import '../../../core/failure/failure.dart';
import '../../../domain/use_case/local_data_usecase.dart';
import '../../../domain/use_case/remote_data_usecase.dart';
// import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // final RecipePageBloc recipePageBloc;
  final LocalDataUseCase localDataUseCase;
  final RemoteDataUseCase remoteDataUseCase;
  // late StreamSubscription streamSubscription;
  ProfileBloc({
    required this.localDataUseCase,
    required this.remoteDataUseCase,
    // required this.recipePageBloc,
  }) : super(ProfileInitial()) {
    // streamSubscription = recipePageBloc.stream.listen((recipePageState) {
    // if (state is RecipeFetchingSuccessState) {
    //   List<int> favoriteIdList = localDataUseCase.getFavoritesDataList();
    //   List<RecipeEntity> recipeList =
    //       (state as RecipeFetchingSuccessState).recipeList;
    //   List<RecipeEntity> updatesFavoritesList = [];

    //   updatesFavoritesList = recipeList
    //       .where(
    //         (element) => favoriteIdList.contains(element.id),
    //       )
    //       .toList();

    //   add(
    //     FetchProfilePageDataEvent(
    //       recipieList: updatesFavoritesList,
    //     ),
    //   );
    // }
    // });
    on<FetchProfilePageDataEvent>(fetchProfilePageDataEvent);
  }

  FutureOr<void> fetchProfilePageDataEvent(
      FetchProfilePageDataEvent event, Emitter<ProfileState> emit) async {
    List<int> favoriteIdList = localDataUseCase.getFavoritesDataList();
    List<RecipeEntity> recipeList = [];
    Either<List<RecipeEntity>, Failure> response =
        await remoteDataUseCase.getDatafromDio();
    response.fold((left) {
      recipeList = left;
    }, (right) {
      recipeList = [];
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

  // Future<List<RecipeEntity>> updatefavorites() async {
  //   List<int> favoriteIdList = localDataUseCase.getFavoritesDataList();
  //   List<RecipeEntity> recipeList = [];
  //   Either<List<RecipeEntity>, Failure> response =
  //       await remoteDataUseCase.getDatafromDio();
  //   response.fold((left) {
  //     recipeList = left;
  //   }, (right) {
  //     recipeList = [];
  //   });
  //   List<RecipeEntity> favoritesList = [];

  //   favoritesList = recipeList
  //       .where(
  //         (element) => favoriteIdList.contains(element.id),
  //       )
  //       .toList();
  //   return favoritesList;
  // }
}
