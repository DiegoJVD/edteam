import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas/src/core/constants/data.dart';
import 'package:notas/src/core/controllers/theme_controller.dart';
import 'package:notas/src/ui/pages/home_page.dart';

void main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ThemeController.instance.initTheme(),
      builder: (snapshot, context) {
      return MaterialApp(
        routes: {HomePage.Home_Page_Route: (context) => const HomePage()},
        debugShowCheckedModeBanner: false,
        title: Constants.MAIN_TITLE,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        initialRoute: HomePage.Home_Page_Route,
      );
    });
  }
}
