import 'dart:io';

import 'package:flutter/material.dart';
import 'config/routes/routes.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'helpers/http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

/// Главный виджет приложения
class MyApp extends StatefulWidget {
  /// Конструктор для [MyApp]
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /// Запрет на изменение размера шрифта через системные настройки
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
