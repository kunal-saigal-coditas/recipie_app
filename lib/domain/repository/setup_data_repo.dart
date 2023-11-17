import '../entity/setup_data_entity/setup_data_entity.dart';

abstract class SetupDataRepository {
  List<SetupDataEntity> getSetupDataList();
  List<List<AnswerItemEntity>> getAnswerList();
}
