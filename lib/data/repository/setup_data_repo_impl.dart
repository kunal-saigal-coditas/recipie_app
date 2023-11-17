import 'package:recipe_app/data/data_source/setup_data_source.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';

import '../../domain/repository/setup_data_repo.dart';

class SetupDataRepositoryImpl implements SetupDataRepository {
  final SetupDataSource setupDataSource;

  SetupDataRepositoryImpl({
    required this.setupDataSource,
  });
  @override
  List<SetupDataEntity> getSetupDataList() {
    return setupDataSource.getSetupDataList();
  }

  @override
  List<List<AnswerItemEntity>> getAnswerList() {
    return setupDataSource.getAnswerList();
  }
}
