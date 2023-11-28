import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/core/constants/color_constants.dart';

class ThemeConstants {
  static ThemeData appTheme = ThemeData(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    useMaterial3: true,
    primaryColor: ColorConstants.c86BF3E,
  );
}
