import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/forum_data_source.dart';
import 'package:recipe_app/data/data_source/grocery_data_source.dart';
import 'package:recipe_app/data/data_source/setup_data_source.dart';
import 'package:recipe_app/data/repository/grocery_data_repo_impl.dart';
import 'package:recipe_app/data/repository/setup_data_repo_impl.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';
import 'package:recipe_app/domain/repository/setup_data_repo.dart';
import 'package:recipe_app/domain/use_case/grocery_data_usecase.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';
import 'package:recipe_app/domain/use_case/setup_data_use_case.dart';
import 'package:recipe_app/presentation/bloc/forum_page_bloc/forum_page_bloc.dart';
import 'package:recipe_app/presentation/bloc/grocery_page_bloc/grocery_page_bloc.dart';
import 'package:recipe_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/bloc/setup_bloc/setup_bloc.dart';

import '../../data/data_source/local_data_source.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/repository/local_data_repo_impl.dart';
import '../../data/repository/remote_data_repo_impl.dart';
import '../../domain/repository/grocery_data_repo.dart';
import '../../domain/repository/local_data_repo.dart';
import '../../domain/use_case/local_data_usecase.dart';

class Injector {
  static void injectorFunction() async {
    GetIt.I
      ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(),
      )
      ..registerLazySingleton<LocalDataSource>(
        () => LocalDataSource(),
      )
      ..registerLazySingleton<SetupDataSource>(
        () => SetupDataSource(),
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
      ..registerLazySingleton<SetupDataRepository>(
        () => SetupDataRepositoryImpl(
          setupDataSource: GetIt.I<SetupDataSource>(),
        ),
      )
      ..registerLazySingleton<GroceryDataRepository>(
        () => GroceryDataRepositoryImpl(
          groceryDataSource: GetIt.I<GroceryDataSource>(),
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
      ..registerLazySingleton<SetupDataUseCase>(
        () => SetupDataUseCase(
          setupDataRepository: GetIt.I<SetupDataRepository>(),
        ),
      )
      ..registerLazySingleton<GroceryDataUseCase>(
        () => GroceryDataUseCase(
          groceryDataRepository: GetIt.I<GroceryDataRepository>(),
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
          // recipePageBloc: GetIt.I<RecipePageBloc>(),
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
          forumDataSource: GetIt.I<ForumDataSource>(),
        ),
      )
      ..registerFactory<SetupBloc>(
        () => SetupBloc(
          setupDataUseCase: GetIt.I<SetupDataUseCase>(),
        ),
      );
  }
}
