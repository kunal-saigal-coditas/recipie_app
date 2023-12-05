import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';
import 'package:recipe_app/domain/repository/preferences_data_repo.dart';

class PreferencesDataUsecase {
  final PreferencesDataRepository preferencesDataRepository;

  PreferencesDataUsecase({
    required this.preferencesDataRepository,
  });

  Future<List<PreferencesDataEntity>> getPreferencesDataList() {
    return preferencesDataRepository.getPreferencesDataList();
  }

  // Future<List<List<AnswerItemEntity>>> getAnswerList() {
  //   return preferencesDataRepository.getAnswerList();
  // }
}
