import 'package:recipe_app/data/data_model/preferences_data_model.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/string_constants.dart';
import '../../../domain/entity/preferences_data_entity/preferences_data_entity.dart';

class PreferencesDataSource {
  PreferencesDataModel preferences1Data = PreferencesDataModel(
    answerItemList: List.generate(
      StringConstants.koptionsForQuestion1.length,
      (index) => AnswerItemEntity(
        id: index,
        text: StringConstants.koptionsForQuestion1[index],
        isSelected: false,
      ),
    ),
    answerBoxType: AnswerBoxType.circularSelectable,
    question: StringConstants.konboardingQuestion1,
    description: StringConstants.konboardingQuestion1Subtext,
  );
  PreferencesDataModel preferences2Data = PreferencesDataModel(
    answerItemList: List.generate(
      StringConstants.koptionsForQuestion2.length,
      (index) => AnswerItemEntity(
        id: index,
        text: StringConstants.koptionsForQuestion2[index],
        isSelected: false,
      ),
    ),
    answerBoxType: AnswerBoxType.normalSelectable,
    question: StringConstants.konboardingQuestion2,
    description: StringConstants.konboardingCommonSubtext,
  );
  PreferencesDataModel preferences3Data = PreferencesDataModel(
    answerItemList: List.generate(
      StringConstants.koptionsForQuestion3.length,
      (index) => AnswerItemEntity(
        id: index,
        text: StringConstants.koptionsForQuestion3[index],
        isSelected: false,
      ),
    ),
    answerBoxType: AnswerBoxType.normalSelectable,
    question: StringConstants.konboardingQuestion3,
    description: StringConstants.konboardingCommonSubtext,
  );
  PreferencesDataModel preferences4Data = PreferencesDataModel(
    answerItemList: List.generate(
      StringConstants.koptionsForQuestion4.length,
      (index) => AnswerItemEntity(
        id: index,
        text: StringConstants.koptionsForQuestion4[index],
        isSelected: false,
      ),
    ),
    answerBoxType: AnswerBoxType.normalSelectable,
    question: StringConstants.konboardingQuestion4,
    description: StringConstants.konboardingCommonSubtext,
  );

  PreferencesDataModel preferences5Data = PreferencesDataModel(
    answerItemList: List.generate(
      StringConstants.koptionsForQuestion5.length,
      (index) => AnswerItemEntity(
        id: index,
        text: StringConstants.koptionsForQuestion5[index],
        isSelected: false,
      ),
    ),
    answerBoxType: AnswerBoxType.circularSelectable,
    question: StringConstants.konboardingQuestion5,
    description: StringConstants.konboardingCommonSubtext,
  );

  List<PreferencesDataEntity> getPreferencesDataList() {
    return [
      preferences1Data,
      preferences2Data,
      preferences3Data,
      preferences4Data,
      preferences5Data,
    ];
  }

  List<List<AnswerItemEntity>> getAnswerList() {
    return [
      preferences1Data.answerItemList,
      preferences2Data.answerItemList,
      preferences3Data.answerItemList,
      preferences4Data.answerItemList,
      preferences5Data.answerItemList,
    ];
  }
}
