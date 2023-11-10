import 'package:recipe_app/data/data_model/setup_data_model.dart';

import '../../core/constants/enums.dart';
import '../../core/constants/string_constants.dart';
import '../../domain/entity/setup_data_entity/setup_data_entity.dart';

class LocalDataSource {
  SetupDataModel setupPage1Data = SetupDataModel(
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
  SetupDataModel setupPage2Data = SetupDataModel(
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
  SetupDataModel setupPage3Data = SetupDataModel(
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
  SetupDataModel setupPage4Data = SetupDataModel(
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

  SetupDataModel setupPage5Data = SetupDataModel(
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

  List<SetupDataEntity> getSetupDataList() {
    return [
      setupPage1Data,
      setupPage2Data,
      setupPage3Data,
      setupPage4Data,
      setupPage5Data,
    ];
  }
}
