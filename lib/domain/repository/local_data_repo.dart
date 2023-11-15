abstract class LocalDataRepository {
  List<int> getFavoritesDataList();
  Future<void> saveToFavorites(List<int> favoritesList);
}
