import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_model/explore_data_model.dart';

class ExploreDataSource {
  final FirebaseFirestore _firestore = GetIt.I<FirebaseFirestore>();

  Future<List<ExploreDataModel>> getExplorePageData() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('exploreCollection').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ExploreDataModel(
        categoryName: data['categoryName'],
        categoryImage: data['categoryImage'],
      );
    }).toList();
  }
}
