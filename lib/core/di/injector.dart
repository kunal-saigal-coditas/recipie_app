import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/data/data_source/remote_data_sources/explore_data_source.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/forum_data_source.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/grocery_data_source.dart';
import 'package:recipe_app/data/data_source/local_data_sources/local_data_source.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/preferences_data_source.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/remote_data_source.dart';
import 'package:recipe_app/data/repository/explore_data_repo_impl.dart';
import 'package:recipe_app/data/repository/forum_data_repo_impl.dart';
import 'package:recipe_app/data/repository/grocery_data_repo_impl.dart';
import 'package:recipe_app/data/repository/local_data_repo_impl.dart';
import 'package:recipe_app/data/repository/preferences_data_repo_impl.dart';
import 'package:recipe_app/data/repository/remote_data_repo_impl.dart';

import 'package:recipe_app/domain/repository/explore_data_repo.dart';
import 'package:recipe_app/domain/repository/forum_data_repo.dart';
import 'package:recipe_app/domain/repository/grocery_data_repo.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';
import 'package:recipe_app/domain/repository/preferences_data_repo.dart';
import 'package:recipe_app/domain/use_case/explore_data_usecase.dart';
import 'package:recipe_app/domain/use_case/forum_data_usecase.dart';
import 'package:recipe_app/domain/use_case/grocery_data_usecase.dart';
import 'package:recipe_app/domain/use_case/preferences_data_usecase.dart';
import 'package:recipe_app/domain/use_case/recipe_usecase.dart';

import 'package:recipe_app/presentation/screens/explore_screen/bloc/explore_page_bloc.dart';
import 'package:recipe_app/presentation/screens/forum_screen/bloc/forum_page_bloc.dart';
import 'package:recipe_app/presentation/screens/grocery_screen/bloc/grocery_page_bloc.dart';
import 'package:recipe_app/presentation/screens/login_screen/cubit/auth_cubit.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/bloc/preferences_bloc.dart';
import 'package:recipe_app/presentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/screens/recipes_screen/bloc/recipe_page_bloc.dart';

class Injector {
  static void injectorFunction() async {
    GetIt.I
      ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(),
      )
      ..registerLazySingleton<LocalDataSource>(
        () => LocalDataSource(),
      )
      ..registerLazySingleton<PreferencesDataSource>(
        () => PreferencesDataSource(),
      )
      ..registerLazySingleton<GroceryDataSource>(
        () => GroceryDataSource(),
      )
      ..registerLazySingleton<ForumDataSource>(
        () => ForumDataSource(),
      )
      ..registerLazySingleton<ExploreDataSource>(
        () => ExploreDataSource(),
      )
      ..registerLazySingleton<RemoteDataRepository>(
        () => RemoteDataRepositoryImpl(
          remoteDataSource: GetIt.I<RemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<LocalDataRepository>(
        () => LocalDataRepositoryImpl(
          localDataSource: GetIt.I<LocalDataSource>(),
        ),
      )
      ..registerLazySingleton<PreferencesDataRepository>(
        () => PreferencesDataRepositoryImpl(
          preferencesDataSource: GetIt.I<PreferencesDataSource>(),
        ),
      )
      ..registerLazySingleton<GroceryDataRepository>(
        () => GroceryDataRepositoryImpl(
          groceryDataSource: GetIt.I<GroceryDataSource>(),
        ),
      )
      ..registerLazySingleton<ForumDataRepository>(
        () => ForumDataRepositoryImpl(
          forumDataSource: GetIt.I<ForumDataSource>(),
        ),
      )
      ..registerLazySingleton<ExploreDataRepository>(
        () => ExploreDataRepositoryImpl(
          exploreDataSource: GetIt.I<ExploreDataSource>(),
        ),
      )
      ..registerLazySingleton<RecipeUsecase>(
        () => RecipeUsecase(
          remoteDataRepository: GetIt.I<RemoteDataRepository>(),
          localDataRepository: GetIt.I<LocalDataRepository>(),
        ),
      )
      ..registerLazySingleton<PreferencesDataUsecase>(
        () => PreferencesDataUsecase(
          preferencesDataRepository: GetIt.I<PreferencesDataRepository>(),
        ),
      )
      ..registerLazySingleton<GroceryDataUsecase>(
        () => GroceryDataUsecase(
          groceryDataRepository: GetIt.I<GroceryDataRepository>(),
        ),
      )
      ..registerLazySingleton<ForumDataUsecase>(
        () => ForumDataUsecase(
          forumDataRepository: GetIt.I<ForumDataRepository>(),
        ),
      )
      ..registerLazySingleton<ExploreDataUsecase>(
        () => ExploreDataUsecase(
          exploreDataRepository: GetIt.I<ExploreDataRepository>(),
        ),
      )
      ..registerFactory<AuthCubit>(
        () => AuthCubit(),
      )
      ..registerFactory<RecipePageBloc>(
        () => RecipePageBloc(
          recipeDataUsecase: GetIt.I<RecipeUsecase>(),
        ),
      )
      ..registerFactory<ProfileBloc>(
        () => ProfileBloc(
          recipePageBloc: GetIt.I<RecipePageBloc>(),
          recipeDataUsecase: GetIt.I<RecipeUsecase>(),
        ),
      )
      ..registerFactory<GroceryPageBloc>(
        () => GroceryPageBloc(
          groceryDataUsecase: GetIt.I<GroceryDataUsecase>(),
        ),
      )
      ..registerFactory<ForumPageBloc>(
        () => ForumPageBloc(
          forumDataUsecase: GetIt.I<ForumDataUsecase>(),
        ),
      )
      ..registerFactory<PreferencesBloc>(
        () => PreferencesBloc(
          preferencesDataUsecase: GetIt.I<PreferencesDataUsecase>(),
        ),
      )
      ..registerFactory<ExplorePageBloc>(
        () => ExplorePageBloc(
          exploreDataUsecase: GetIt.I<ExploreDataUsecase>(),
        ),
      )
      ..registerLazySingleton(
        () => FirebaseFirestore.instance,
      );
  }
}
