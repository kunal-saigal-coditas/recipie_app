import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/image_constant.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/widget/explore_page_widgets/category_icon_card_widget.dart';
import 'package:recipe_app/presentation/widget/search_bar_widget.dart';

@RoutePage()
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            StringConstants.ksearchText,
            style: GoogleFonts.cabin(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            8,
            16,
            8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchBarWidget(),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  StringConstants.kcategoriestext,
                  style: GoogleFonts.cabin(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2 / 1,
                  ),
                  itemCount: StringConstants.kcategoryNames.length,
                  itemBuilder: (context, index) => CategoryItemCard(
                    categoryName: StringConstants.kcategoryNames[index],
                    categoryImage: ImageConstants.kcategoryImages[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
