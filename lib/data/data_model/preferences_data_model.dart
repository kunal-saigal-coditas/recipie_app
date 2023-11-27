import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';

class PreferencesDataModel extends PreferencesDataEntity {
  const PreferencesDataModel({
    required super.answerItemList,
    required super.answerBoxType,
    required super.question,
    required super.description,
  });
}
