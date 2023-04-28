import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtension on BuildContext {
  Color get disabledColor => Theme.of(this).disabledColor;
  Color? get textColor => Theme.of(this).textTheme.bodyLarge!.color;
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get sizeWidth => MediaQuery.of(this).size.width;
  double get sizeHeight => MediaQuery.of(this).size.height;
  TextStyle get readFont => GoogleFonts.amiriQuran(
        fontSize: 24,
      );
  TextStyle get arabTitleFont => GoogleFonts.scheherazadeNew(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );
  TextStyle get arabTitleFont1 => GoogleFonts.scheherazadeNew(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
}
