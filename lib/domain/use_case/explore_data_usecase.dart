import 'package:recipe_app/domain/entity/explore_data_entity/explore_data_entity.dart';
import 'package:recipe_app/domain/repository/explore_data_repo.dart';

class ExploreDataUsecase {
  final ExploreDataRepository exploreDataRepository;

  ExploreDataUsecase({
    required this.exploreDataRepository,
  });

  Future<List<ExploreDataEntity>> getExplorePageData() {
    return exploreDataRepository.getExplorePageData();
  }
}
