import 'package:recipe_app/domain/repository/preferences_data_repo.dart';

import '../entity/preferences_data_entity/preferences_data_entity.dart';

class PreferencesDataUseCase {
  final PreferencesDataRepository preferencesDataRepository;

  PreferencesDataUseCase({
    required this.preferencesDataRepository,
  });

  List<PreferencesDataEntity> getPreferencesDataList() {
    return preferencesDataRepository.getPreferencesDataList();
  }

  List<List<AnswerItemEntity>> getAnswerList() {
    return preferencesDataRepository.getAnswerList();
  }
}
