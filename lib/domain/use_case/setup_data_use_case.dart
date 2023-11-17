import 'package:recipe_app/domain/repository/setup_data_repo.dart';

import '../entity/setup_data_entity/setup_data_entity.dart';

class SetupDataUseCase {
  final SetupDataRepository setupDataRepository;

  SetupDataUseCase({
    required this.setupDataRepository,
  });
  List<SetupDataEntity> getSetupDataList() {
    return setupDataRepository.getSetupDataList();
  }

  List<List<AnswerItemEntity>> getAnswerList() {
    return setupDataRepository.getAnswerList();
  }
}
