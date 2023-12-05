import 'package:recipe_app/data/data_source/local_data_sources/preferences_data_source.dart';
import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';
import 'package:recipe_app/domain/repository/preferences_data_repo.dart';

class PreferencesDataRepositoryImpl implements PreferencesDataRepository {
  final PreferencesDataSource preferencesDataSource;

  PreferencesDataRepositoryImpl({
    required this.preferencesDataSource,
  });

  @override
  Future<List<PreferencesDataEntity>> getPreferencesDataList() {
    return preferencesDataSource.getPreferencesDataList();
  }

  // @override
  // Future<List<List<AnswerItemEntity>>> getAnswerList() {
  //   return preferencesDataSource.getAnswerList();
  // }
}
