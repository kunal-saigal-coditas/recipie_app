import 'package:get_it/get_it.dart';
import 'package:recipe_app/domain/repository/remote_data_repo.dart';
import 'package:recipe_app/domain/use_case/remote_data_usecase.dart';
import 'package:recipe_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipie_page_bloc/recipe_page_bloc.dart';
import 'package:recipe_app/presentation/bloc/setup_bloc/setup_bloc.dart';

import '../../data/data_source/local_data_source.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/repository/local_data_repo_impl.dart';
import '../../data/repository/remote_data_repo_impl.dart';
import '../../domain/repository/local_data_repo.dart';
import '../../domain/use_case/local_data_usecase.dart';

class Injector {
  static void injectorFunction() {
    GetIt.I
      ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(),
      )
      ..registerLazySingleton<LocalDataSource>(
        () => LocalDataSource(),
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
      ..registerFactory<RecipePageBloc>(
        () => RecipePageBloc(
          remoteDataUsecase: GetIt.I<RemoteDataUseCase>(),
        ),
      )
      ..registerFactory<ProfileBloc>(
        () => ProfileBloc(),
      )
      ..registerFactory<SetupBloc>(
        () => SetupBloc(
          localDataUseCase: GetIt.I<LocalDataUseCase>(),
        ),
      );
  }
}
