import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';

class SetupDataModel extends SetupDataEntity {
  const SetupDataModel({
    required super.answerItemList,
    required super.answerBoxType,
    required super.question,
    required super.description,
  });
}
