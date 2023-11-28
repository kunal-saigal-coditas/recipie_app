import 'package:recipe_app/data/data_model/grocery_data_model.dart';
import 'package:recipe_app/domain/repository/grocery_data_repo.dart';

class GroceryDataUsecase {
  final GroceryDataRepository groceryDataRepository;

  GroceryDataUsecase({
    required this.groceryDataRepository,
  });

  List<GroceryDataModel> groceryItemList() {
    return groceryDataRepository.groceryItemList();
  }
}
