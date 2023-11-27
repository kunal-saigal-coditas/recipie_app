import 'package:get_it/get_it.dart';

import 'package:recipe_app/data/data_source/local_data_sources/forum_data_source.dart';
import 'package:recipe_app/data/data_source/local_data_sources/grocery_data_source.dart';
import 'package:recipe_app/data/data_source/local_data_sources/local_data_source.dart';
import 'package:recipe_app/data/data_source/local_data_sources/preferences_data_source.dart';
import 'package:recipe_app/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:recipe_app/data/repository/forum_data_repo_impl.dart';
import 'package:recipe_app/data/repository/grocery_data_repo_impl.dart';
import 'package:recipe_app/data/repository/local_data_repo_impl.dart';
import 'package:recipe_app/data/repository/preferences_data_repo_impl.dart';
import 'package:recipe_app/data/repository/remote_data_repo_impl.dart';
import 'package:recipe_app/domain/repository/forum_data_repo.dart';
import 'package:recipe_app/domain/repository/grocery_data_repo.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';
import 'package:recipe_app/domain/repository/preferences_data_repo.dart';
import 'package:recipe_app/domain/use_case/forum_data_usecase.dart';
import 'package:recipe_app/domain/use_case/grocery_data_usecase.dart';
import 'package:recipe_app/domain/use_case/local_data_usecase.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';
import 'package:recipe_app/domain/use_case/preferences_data_use_case.dart';
import 'package:recipe_app/presentation/screens/forum_screen/bloc/forum_page_bloc.dart';
import 'package:recipe_app/presentation/screens/grocery_screen/bloc/grocery_page_bloc.dart';
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
      ..registerLazySingleton<RemoteDataUseCase>(
        () => RemoteDataUseCase(
          remoteDataRepository: GetIt.I<RemoteDataRepository>(),
        ),
      )
      ..registerLazySingleton<LocalDataUseCase>(
        () => LocalDataUseCase(
          localDataRepository: GetIt.I<LocalDataRepository>(),
        ),
      )
      ..registerLazySingleton<PreferencesDataUseCase>(
        () => PreferencesDataUseCase(
          preferencesDataRepository: GetIt.I<PreferencesDataRepository>(),
        ),
      )
      ..registerLazySingleton<GroceryDataUseCase>(
        () => GroceryDataUseCase(
          groceryDataRepository: GetIt.I<GroceryDataRepository>(),
        ),
      )
      ..registerLazySingleton<ForumDataUseCase>(
        () => ForumDataUseCase(
          forumDataRepository: GetIt.I<ForumDataRepository>(),
        ),
      )
      ..registerFactory<RecipePageBloc>(
        () => RecipePageBloc(
          remoteDataUsecase: GetIt.I<RemoteDataUseCase>(),
          localDataUseCase: GetIt.I<LocalDataUseCase>(),
        ),
      )
      ..registerFactory<ProfileBloc>(
        () => ProfileBloc(
          recipePageBloc: GetIt.I<RecipePageBloc>(),
          remoteDataUseCase: GetIt.I<RemoteDataUseCase>(),
          localDataUseCase: GetIt.I<LocalDataUseCase>(),
        ),
      )
      ..registerFactory<GroceryPageBloc>(
        () => GroceryPageBloc(
          groceryDataUseCase: GetIt.I<GroceryDataUseCase>(),
        ),
      )
      ..registerFactory<ForumPageBloc>(
        () => ForumPageBloc(
          forumDataUseCase: GetIt.I<ForumDataUseCase>(),
        ),
      )
      ..registerFactory<PreferencesBloc>(
        () => PreferencesBloc(
          preferencesDataUseCase: GetIt.I<PreferencesDataUseCase>(),
        ),
      );
  }
}
