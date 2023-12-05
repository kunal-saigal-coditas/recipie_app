import 'package:recipe_app/data/data_source/local_data_sources/explore_data_source.dart';
import 'package:recipe_app/domain/entity/explore_data_entity/explore_data_entity.dart';
import 'package:recipe_app/domain/repository/explore_data_repo.dart';

class ExploreDataRepositoryImpl implements ExploreDataRepository {
  final ExploreDataSource exploreDataSource;

  const ExploreDataRepositoryImpl({required this.exploreDataSource});

  @override
  Future<List<ExploreDataEntity>> getExplorePageData() {
    return exploreDataSource.getExplorePageData();
  }
}
