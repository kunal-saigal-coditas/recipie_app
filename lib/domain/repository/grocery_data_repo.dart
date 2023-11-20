import '../../data/data_model/grocery_data_model.dart';

abstract class GroceryDataRepository {
  List<GroceryDataModel> grocerItemList();
}
