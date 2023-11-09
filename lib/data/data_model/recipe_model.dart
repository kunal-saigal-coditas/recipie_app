class RecipeModel {
  int id;
  String title;
  String summary;
  String image;
  int readyInMinutes;
  String sourceUrl;
  List<dynamic> cuisines;
  bool dairyFree;
  bool glutenFree;
  String instructions;
  bool ketogenic;
  bool vegan;
  bool vegetarian;
  bool veryHealthy;
  bool veryPopular;
  List<String> dishTypes;
  List<ExtendedIngredient> extendedIngredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.image,
    required this.readyInMinutes,
    required this.sourceUrl,
    required this.cuisines,
    required this.dairyFree,
    required this.glutenFree,
    required this.instructions,
    required this.ketogenic,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.dishTypes,
    required this.extendedIngredients,
  });
}

class ExtendedIngredient {
  double amount;
  int id;
  String image;
  String name;

  ExtendedIngredient({
    required this.amount,
    required this.id,
    required this.image,
    required this.name,
  });
}
