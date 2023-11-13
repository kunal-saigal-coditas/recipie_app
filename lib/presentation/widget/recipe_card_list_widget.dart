import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

class RecipieCardListWidget extends StatelessWidget {
  const RecipieCardListWidget({
    super.key,
    required this.sectionRecipeList,
    required this.onPressed,
  });

  final List<RecipeEntity> sectionRecipeList;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sectionRecipeList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:
                      // NetworkImage(sectionRecipeList[index].image)
                      AssetImage(sectionRecipeList[index].image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.secondaryWhiteBackgraound,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.favorite_border,
                                color: ColorConstants.whiteBackgraound,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      sectionRecipeList[index].title,
                      style: const TextStyle(
                        color: ColorConstants.whiteBackgraound,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      sectionRecipeList[index].summary,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 9, color: ColorConstants.whiteBackgraound),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
