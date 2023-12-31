import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/screens/explore_screen/widgets/category_icon_card_widget.dart';
import 'package:recipe_app/presentation/common/search_bar_widget.dart';

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
          padding: EdgeInsets.only(
            top: 16.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchBarWidget(),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  StringConstants.kcategoriesText,
                  style: GoogleFonts.cabin(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 13,
                    childAspectRatio: 2 / 1,
                  ),
                  itemCount: StringConstants.kcategoryNames.length,
                  itemBuilder: (context, index) => CategoryItemCard(
                    categoryName: StringConstants.kcategoryNames[index],
                    categoryImage: AssetConstantStrings.kcategoryImages[index],
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
