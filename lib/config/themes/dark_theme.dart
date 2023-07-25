import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData createDarkTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: "Golos-Text-Medium",
      scaffoldBackgroundColor: AppDarkThemeColors.background01,
      brightness: Brightness.dark,
    );
