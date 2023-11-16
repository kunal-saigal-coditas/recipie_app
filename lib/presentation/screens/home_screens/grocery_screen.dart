import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

@RoutePage()
class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key, required this.groceryPageList});
  final List<RecipeEntity> groceryPageList;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
