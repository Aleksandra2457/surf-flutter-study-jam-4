import 'dart:ui';

abstract final class AppDarkThemeColors {
  /// Primary colors
  static const Color background01 = Color.fromRGBO(16, 12, 44, 1);
  static const Color background02 = Color.fromRGBO(0, 0, 2, 1);
  
  static const Color mainText = Color.fromRGBO(255, 255, 255, 1);
  static const Color additionalText = Color.fromRGBO(114, 114, 114, 1);
}

abstract final class AppLightThemeColors {
  /// Primary colors
  static const Color background01 = Color.fromRGBO(255, 255, 255, 1);
  static const Color background02 = Color.fromRGBO(211, 211, 255, 1);

  static const Color mainText = Color.fromRGBO(108, 105, 140, 1);
  static const Color additionalText = Color.fromRGBO(108, 105, 140, 1);
}