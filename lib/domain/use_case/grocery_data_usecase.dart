import 'package:recipe_app/domain/repository/grocery_data_repo.dart';

import '../../data/data_model/grocery_data_model.dart';

class GroceryDataUseCase {
  final GroceryDataRepository groceryDataRepository;

  GroceryDataUseCase({
    required this.groceryDataRepository,
  });

  List<GroceryDataModel> grocerItemList() {
    return groceryDataRepository.grocerItemList();
  }
}
