import 'package:recipe_app/data/data_model/preferences_data_model.dart';
import 'package:recipe_app/data/data_source/remote_data_sources/preferences_data_source.dart';
import 'package:recipe_app/domain/repository/preferences_data_repo.dart';

class PreferencesDataRepositoryImpl implements PreferencesDataRepository {
  final PreferencesDataSource preferencesDataSource;

  PreferencesDataRepositoryImpl({
    required this.preferencesDataSource,
  });

  @override
  Future<List<PreferencesDataModel>> getPreferencesDataList() {
    return preferencesDataSource.getPreferencesDataList();
  }
}
