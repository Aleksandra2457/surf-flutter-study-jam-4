import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData createDarkTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: "Golos-Text-Medium",
      colorScheme: const ColorScheme.dark(
          primary: AppDarkThemeColors.background01,
          secondary: AppDarkThemeColors.background02,
          brightness: Brightness.dark),
    );
