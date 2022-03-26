import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [GoogleFonts] package added

class AppConstants {
  /// [MaterialColor] Constants
  static const MaterialColor primaryColor = Colors.indigo;

  /// [Text] Constants
  static const String title = "Calculate Average";

  /// [BorderRadius]
  static final BorderRadius borderRadius20 = BorderRadius.circular(20);

  /// [Padding]
  static const EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 6);

  /// [TextStyle] Constants

  static TextStyle styles(
      {double fontSize = 16.00,
      FontWeight fontWeight = FontWeight.w500,
      Color color = primaryColor}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static final TextStyle headlineStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: primaryColor,
  );

  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );
}
