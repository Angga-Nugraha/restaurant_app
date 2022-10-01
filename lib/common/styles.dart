import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTextTheme = TextTheme(
  headline1: GoogleFonts.lemonada(
      fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.raleway(
      fontSize: 51, fontWeight: FontWeight.w700, letterSpacing: -0.5),
  headline3: GoogleFonts.lemonada(fontSize: 41, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lemonada(
      fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.robotoMono(fontSize: 20, fontWeight: FontWeight.w900),
  headline6: GoogleFonts.lemonada(
      fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lemonada(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lemonada(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.sourceSerifPro(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.sourceSerifPro(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.sourceSerifPro(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.sourceSerifPro(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.sourceSerifPro(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

const Color primaryColor = Colors.indigo;
const Color secondaryColor = Colors.white;

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
      ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: secondaryColor,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);

const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Color(0xff64ffda);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: Colors.white,
        secondary: darkSecondaryColor,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);
