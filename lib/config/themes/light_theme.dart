import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData createLightTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: "Golos-Text-Medium",
      scaffoldBackgroundColor: AppLightThemeColors.background01,
      brightness: Brightness.light,
    );
