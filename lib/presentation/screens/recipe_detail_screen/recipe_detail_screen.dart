import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/test_data.dart';
import '../../widget/recipie_detail_page_widgets/recipe_detail_demo.dart';

@RoutePage()
class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    // @PathParam() required this.recipeEntity,
  });
  // final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RecipeDetailsDemo(recipeEntity: demoRecipeList[3]),
      ),
    );
  }
}
