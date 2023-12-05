import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_model/grocery_data_model.dart';

class GroceryDataSource {
  final FirebaseFirestore _firestore = GetIt.I<FirebaseFirestore>();

  Future<List<GroceryDataModel>> groceryItemList() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('groceryCollection').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return GroceryDataModel(
        groceryImageUrl: data['groceryImageUrl'],
        groceryName: data['grocerName'],
        grocerySubtext: data['grocerSubtext'],
        isDone: false,
      );
    }).toList();
  }
}
