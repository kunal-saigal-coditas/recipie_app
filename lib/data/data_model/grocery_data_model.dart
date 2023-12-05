import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';

class GroceryDataModel extends GroceryDataEntity {
  const GroceryDataModel({
    required super.groceryName,
    required super.grocerySubtext,
    required super.groceryImageUrl,
    super.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'groceryName': groceryName,
      'grocerySubtext': grocerySubtext,
      'groceryImageUrl': groceryImageUrl,
      'isDone': isDone,
    };
  }

  factory GroceryDataModel.fromJson(Map<String, dynamic> json) {
    return GroceryDataModel(
      groceryName: json['groceryName'],
      grocerySubtext: json['grocerySubtext'],
      groceryImageUrl: json['groceryImageUrl'],
      isDone: json['isDone'] ?? false,
    );
  }
}
