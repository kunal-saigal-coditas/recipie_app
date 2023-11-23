import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/di/injector.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/data/data_source/local_data_source.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.injectorFunction();
  (GetIt.I<LocalDataSource>()).init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(
          375,
          812,
        ),
        builder: (_, child) => MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          title: 'Recipe App',
          theme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
