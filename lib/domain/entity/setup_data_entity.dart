import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/constants/string_constants.dart';

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

enum AnswerBoxType { circularSelectable, normalSelectable }

SetupDataEntity setupPage1Data = SetupDataEntity(
  answerItemList: List.generate(
    StringConstants.koptionsForQuestion1.length,
    (index) => AnswerItemEntity(
      text: StringConstants.koptionsForQuestion1[index],
      isSelected: false,
    ),
  ),
  answerBoxType: AnswerBoxType.circularSelectable,
  question: StringConstants.konboardingQuestion1,
  description: StringConstants.konboardingQuestion1Subtext,
);
SetupDataEntity setupPage2Data = SetupDataEntity(
  answerItemList: List.generate(
    StringConstants.koptionsForQuestion2.length,
    (index) => AnswerItemEntity(
      text: StringConstants.koptionsForQuestion2[index],
      isSelected: false,
    ),
  ),
  answerBoxType: AnswerBoxType.normalSelectable,
  question: StringConstants.konboardingQuestion2,
  description: StringConstants.konboardingCommonSubtext,
);
SetupDataEntity setupPage3Data = SetupDataEntity(
  answerItemList: List.generate(
    StringConstants.koptionsForQuestion3.length,
    (index) => AnswerItemEntity(
      text: StringConstants.koptionsForQuestion3[index],
      isSelected: false,
    ),
  ),
  answerBoxType: AnswerBoxType.normalSelectable,
  question: StringConstants.konboardingQuestion3,
  description: StringConstants.konboardingCommonSubtext,
);
SetupDataEntity setupPage4Data = SetupDataEntity(
  answerItemList: List.generate(
    StringConstants.koptionsForQuestion4.length,
    (index) => AnswerItemEntity(
      text: StringConstants.koptionsForQuestion4[index],
      isSelected: false,
    ),
  ),
  answerBoxType: AnswerBoxType.normalSelectable,
  question: StringConstants.konboardingQuestion4,
  description: StringConstants.konboardingCommonSubtext,
);
SetupDataEntity setupPage5Data = SetupDataEntity(
  answerItemList: List.generate(
    StringConstants.koptionsForQuestion5.length,
    (index) => AnswerItemEntity(
      text: StringConstants.koptionsForQuestion5[index],
      isSelected: false,
    ),
  ),
  answerBoxType: AnswerBoxType.circularSelectable,
  question: StringConstants.konboardingQuestion5,
  description: StringConstants.konboardingCommonSubtext,
);

class SetupPageData {
  static List<SetupDataEntity> setupPageDataList = [
    setupPage1Data,
    setupPage2Data,
    setupPage3Data,
    setupPage4Data,
    setupPage5Data,
  ];
}
