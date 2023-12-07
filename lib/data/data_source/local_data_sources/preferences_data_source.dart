import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_model/preferences_data_model.dart';
// import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';

class PreferencesDataSource {
  final FirebaseFirestore _firestore = GetIt.I<FirebaseFirestore>();
  Future<List<PreferencesDataModel>> getPreferencesDataList() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('preferencesCollection')
        .orderBy('index')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return PreferencesDataModel(
        answerItemList: (data['answeItemList'] as List)
            .map(
              (item) => AnswerItemModel(
                text: item,
                id: 1,
                isSelected: false,
              ),
            )
            .toList(),
        question: data['question'],
        description: data['description'],
      );
    }).toList();
  }
}
