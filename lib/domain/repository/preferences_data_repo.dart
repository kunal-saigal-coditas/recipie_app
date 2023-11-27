import '../entity/preferences_data_entity/preferences_data_entity.dart';

abstract class PreferencesDataRepository {
  List<PreferencesDataEntity> getPreferencesDataList();

  List<List<AnswerItemEntity>> getAnswerList();
}
