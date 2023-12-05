import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';

abstract class PreferencesDataRepository {
  Future<List<PreferencesDataEntity>> getPreferencesDataList();

  // Future<List<List<AnswerItemEntity>>> getAnswerList();
}
