import 'package:recipe_app/data/data_source/local_data_source.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/domain/repository/local_data_repo.dart';

class LocalDataRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localDataSource;

  LocalDataRepositoryImpl({required this.localDataSource});
  @override
  List<SetupDataEntity> getSetupDataList() {
    return localDataSource.getSetupDataList();
  }
}
