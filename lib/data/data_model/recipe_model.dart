import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel(
      {required super.id,
      required super.title,
      required super.summary,
      required super.image,
      required super.readyInMinutes,
      required super.sourceUrl,
      required super.instructions,
      required super.extendedIngredients,
      required super.isFavorite});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      title: json["title"],
      summary: json["summary"],
      image: json["image"],
      readyInMinutes: json["readyInMinutes"],
      sourceUrl: json["sourceUrl"],
      instructions: json["instructions"] ?? "",
      extendedIngredients: (json["extendedIngredients"] as List<dynamic>)
          .map(
            (e) => ExtendedIngredientModel.fromJson(e),
          )
          .toList(),
      isFavorite: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "summary": summary,
      "image": image,
      "readyInMinutes": readyInMinutes,
      "sourceUrl": sourceUrl,
      "instructions": instructions,
      "extendedIngredients": extendedIngredients
          .map(
            (e) => e.toModel().toJson(),
          )
          .toList(),
    };
  }
}

class ExtendedIngredientModel extends ExtendedIngredientEntity {
  const ExtendedIngredientModel({
    required super.amount,
    required super.id,
    required super.image,
    required super.name,
  });

  factory ExtendedIngredientModel.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredientModel(
      amount: json['amount'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'id': id,
      'image': image,
      'name': name,
    };
  }
}
