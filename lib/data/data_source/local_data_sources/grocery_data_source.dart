import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/data/data_model/grocery_data_model.dart';

class GroceryDataSource {
  GroceryDataModel groceryItem1 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[0],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[0],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[0],
  );
  GroceryDataModel groceryItem2 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[1],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[1],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[1],
  );
  GroceryDataModel groceryItem3 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[2],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[2],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[2],
  );
  GroceryDataModel groceryItem4 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[3],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[3],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[3],
  );
  GroceryDataModel groceryItem5 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[4],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[4],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[4],
  );
  GroceryDataModel groceryItem6 = GroceryDataModel(
    groceryName: StringConstants.kgroceryPageMainTextList[5],
    grocerySubtext: StringConstants.kgroceryPageSubtextList[5],
    groceryImageUrl: AssetConstantStrings.kgroceryPageImages[5],
  );

  List<GroceryDataModel> groceryItemList() {
    return [
      groceryItem1,
      groceryItem2,
      groceryItem3,
      groceryItem4,
      groceryItem5,
      groceryItem6,
    ];
  }
}
