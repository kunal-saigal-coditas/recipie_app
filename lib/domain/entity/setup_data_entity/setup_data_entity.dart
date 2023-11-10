import 'package:equatable/equatable.dart';
import '../../../core/constants/enums.dart';

class SetupDataEntity extends Equatable {
  final String question;
  final String description;
  final List<AnswerItemEntity> answerItemList;
  final AnswerBoxType answerBoxType;
  const SetupDataEntity({
    required this.answerItemList,
    required this.answerBoxType,
    required this.question,
    required this.description,
  });

  @override
  List<Object?> get props => [
        question,
        description,
        answerBoxType,
        answerItemList,
      ];
}

class AnswerItemEntity {
  final String text;
  bool isSelected;

  AnswerItemEntity({
    required this.text,
    required this.isSelected,
  });

  AnswerItemEntity copyWith({String? text, bool? isSelected}) {
    return AnswerItemEntity(
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
