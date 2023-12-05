import 'package:recipe_app/domain/entity/explore_data_entity/explore_data_entity.dart';

class ExploreDataModel extends ExploreDataEntity {
  const ExploreDataModel({
    required super.categoryName,
    required super.categoryImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'categoryImage': categoryImage,
    };
  }

  factory ExploreDataModel.fromJson(Map<String, dynamic> json) {
    return ExploreDataModel(
      categoryName: json['categoryName'] ?? '',
      categoryImage: json['categoryImage'] ?? '',
    );
  }
}
