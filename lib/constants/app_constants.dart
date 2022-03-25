import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [GoogleFonts] package added

class AppConstants {
  /// [MaterialColor] Constants
  static const MaterialColor primaryColor = Colors.indigo;

  /// [Text] Constants
  static const String title = "Calculate Average";

  /// [TextStyle] Constants

  static final TextStyle headlineStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: primaryColor,
  );
}
