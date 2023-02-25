import 'package:flutter/material.dart';

abstract class AppColors {
  static const mainPurpleColor = Color.fromARGB(255, 36, 26, 34);

  static const MaterialColor purpleMaterial =
      MaterialColor(_purplematerialPrimaryValue, <int, Color>{
    50: Color(0xFFEBE8EB),
    100: Color(0xFFCEC6CD),
    200: Color(0xFFAEA1AB),
    300: Color(0xFF8D7B89),
    400: Color(0xFF745E70),
    500: Color(_purplematerialPrimaryValue),
    600: Color(0xFF543C4F),
    700: Color(0xFF4A3346),
    800: Color(0xFF412B3C),
    900: Color(0xFF301D2C),
  });
  static const int _purplematerialPrimaryValue = 0xFF241A22;
}
