import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';

abstract class LocalDataRepository {
  List<SetupDataEntity> getSetupDataList();
}
