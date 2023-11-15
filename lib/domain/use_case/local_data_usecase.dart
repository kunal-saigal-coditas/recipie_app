import 'package:recipe_app/domain/repository/local_data_repo.dart';

class LocalDataUseCase {
  final LocalDataRepository localDataRepository;

  LocalDataUseCase({required this.localDataRepository});

  List<int> getFavoritesDataList() {
    return localDataRepository.getFavoritesDataList();
  }

  Future<void> saveToFavorites(List<int> favoritesList) {
    return localDataRepository.saveToFavorites(favoritesList);
  }
}
