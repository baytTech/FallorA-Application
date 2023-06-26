import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get transparent => const Color(0x00FFFFFF);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get primaryColor => const Color(0xFF730195);
  static Color get secondaryColor => const Color(0xFF40113B);

  static LinearGradient get pageGradient => LinearGradient(
      stops: [0.0, 0.5, 1.0],
      begin: AlignmentDirectional(0.0, -1.0),
      end: AlignmentDirectional(0, 1.0),
      colors: [
        Color.fromARGB(255, 23, 24, 27),
        Color.fromARGB(255, 40, 45, 52),
        Color.fromARGB(255, 23, 24, 27),
      ]);

  static LinearGradient get appBarGradiet =>
      LinearGradient(colors: [Color(0xFF31113B), Color(0xFF258195)]);
}
