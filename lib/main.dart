import 'package:flutter/material.dart';
import 'package:flutter_catalog_app/utils/routes.dart';
import 'pages/home.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: 'Catalog App',
    //home: HomePage(),
    themeMode: ThemeMode.light,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      MyRoutes.loginRoute: (context) => LoginPage(),
      MyRoutes.homeRoute: (context) => HomePage(),
    },
  ));
}
