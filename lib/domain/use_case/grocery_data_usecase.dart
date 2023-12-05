import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';
import 'package:recipe_app/domain/repository/grocery_data_repo.dart';

class GroceryDataUsecase {
  final GroceryDataRepository groceryDataRepository;

  GroceryDataUsecase({
    required this.groceryDataRepository,
  });

  Future<List<GroceryDataEntity>> groceryItemList() {
    return groceryDataRepository.groceryItemList();
  }
}
