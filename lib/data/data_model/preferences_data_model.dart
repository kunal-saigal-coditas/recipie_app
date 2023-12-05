import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';

class PreferencesDataModel extends PreferencesDataEntity {
  const PreferencesDataModel({
    required super.answerItemList,
    required super.question,
    required super.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'description': description,
      'answerItemList': answerItemList
          .map(
            (item) => item.toModel().toJson(),
          )
          .toList(),
    };
  }

  factory PreferencesDataModel.fromJson(Map<String, dynamic> json) {
    return PreferencesDataModel(
      question: json['question'] as String,
      description: json['description'] as String,
      answerItemList: (json['answerItemList'] as List)
          .map((item) => AnswerItemModel.fromJson(item))
          .toList(),
    );
  }
}

class AnswerItemModel extends AnswerItemEntity {
  AnswerItemModel({
    required super.text,
    required super.id,
    required super.isSelected,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isSelected': isSelected,
      'id': id,
    };
  }

  factory AnswerItemModel.fromJson(Map<String, dynamic> json) {
    return AnswerItemModel(
      text: json['text'] as String,
      isSelected: json['isSelected'] ?? false,
      id: json['id'] as int,
    );
  }
}
