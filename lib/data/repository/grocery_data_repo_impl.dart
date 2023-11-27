import 'package:recipe_app/data/data_model/grocery_data_model.dart';
import 'package:recipe_app/data/data_source/local_data_sources/grocery_data_source.dart';

import '../../domain/repository/grocery_data_repo.dart';

class GroceryDataRepositoryImpl extends GroceryDataRepository {
  final GroceryDataSource groceryDataSource;

  GroceryDataRepositoryImpl({
    required this.groceryDataSource,
  });

  @override
  List<GroceryDataModel> groceryItemList() {
    return groceryDataSource.groceryItemList();
  }
}
