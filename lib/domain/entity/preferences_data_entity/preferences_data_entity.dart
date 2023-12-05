import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/data_model/preferences_data_model.dart';

class PreferencesDataEntity extends Equatable {
  final String question;
  final String description;
  final List<AnswerItemEntity> answerItemList;
  const PreferencesDataEntity({
    required this.answerItemList,
    required this.question,
    required this.description,
  });

  PreferencesDataModel toModel() {
    return PreferencesDataModel(
      answerItemList: answerItemList,
      question: question,
      description: description,
    );
  }

  @override
  List<Object?> get props => [
        question,
        description,
        answerItemList,
      ];
}

class AnswerItemEntity {
  final String text;
  bool isSelected;
  final int id;

  AnswerItemEntity({
    required this.text,
    required this.id,
    required this.isSelected,
  });

  AnswerItemModel toModel() {
    return AnswerItemModel(
      text: text,
      id: id,
      isSelected: isSelected,
    );
  }

  AnswerItemEntity copyWith({
    String? text,
    bool? isSelected,
    int? id,
  }) {
    return AnswerItemEntity(
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
      id: id ?? this.id,
    );
  }
}
