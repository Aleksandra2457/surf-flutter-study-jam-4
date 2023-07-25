import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData createLightTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: "Golos-Text-Medium",
      colorScheme: const ColorScheme.light(
          primary: AppLightThemeColors.background01,
          secondary: AppLightThemeColors.background02,
          brightness: Brightness.light),
    );
