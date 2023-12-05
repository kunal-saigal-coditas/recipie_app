import 'package:recipe_app/domain/entity/explore_data_entity/explore_data_entity.dart';

abstract class ExploreDataRepository {
  Future<List<ExploreDataEntity>> getExplorePageData();
}
