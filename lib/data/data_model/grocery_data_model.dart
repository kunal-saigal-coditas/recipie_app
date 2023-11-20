import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';

class GroceryDataModel extends GroceryDataEntity {
  const GroceryDataModel({
    required super.groceryName,
    required super.grocerySubtext,
    required super.groceryImageUrl,
    super.isDone = false,
  });
}
