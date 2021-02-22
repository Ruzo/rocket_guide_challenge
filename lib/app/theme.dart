import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    TextTheme _textTheme = _customTextTheme(Brightness.light);
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
    );
  }

  static ThemeData dark() {
    TextTheme _textTheme = _customTextTheme(Brightness.dark);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
    );
  }

  static const _primaryColor = Colors.black;
  static const _accentColor = Colors.white;

  static TextTheme _customTextTheme(Brightness brightness) {
    return GoogleFonts.exo2TextTheme(
      ThemeData(
        brightness: brightness,
      ).textTheme,
    ).copyWith(
      headline1: GoogleFonts.audiowide(),
      headline2: GoogleFonts.audiowide(),
      headline3: GoogleFonts.audiowide(),
      headline4: GoogleFonts.audiowide(),
      headline5: GoogleFonts.audiowide(),
      headline6: GoogleFonts.audiowide(),
    );
  }
}
