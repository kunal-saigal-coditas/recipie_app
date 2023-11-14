import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/di/injector.dart';
import 'package:recipe_app/core/routes/routes.dart';

void main() {
  Injector.injectorFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return SafeArea(
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          fontFamily: GoogleFonts.cabin().fontFamily,
          useMaterial3: true,
        ),
      ),
    );
  }
}
