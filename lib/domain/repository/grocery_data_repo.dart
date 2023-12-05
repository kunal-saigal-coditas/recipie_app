import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';

abstract class GroceryDataRepository {
  Future<List<GroceryDataEntity>> groceryItemList();
}
