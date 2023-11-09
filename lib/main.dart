import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screens/setup_screen/setup_screen.dart';
// import 'package:recipe_app/presentation/screens/onboarding_screens/splash_onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SetupPage(),
      ),
    );
  }
}
