import 'package:recipe_app/domain/repository/local_data_repo.dart';

import '../entity/setup_data_entity/setup_data_entity.dart';

class LocalDataUseCase {
  final LocalDataRepository localDataRepository;

  LocalDataUseCase({required this.localDataRepository});

  List<SetupDataEntity> getSetupDataList() {
    return localDataRepository.getSetupDataList();
  }
}
