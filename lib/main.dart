import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/bloc/prediction_bloc.dart';
import 'config/routes/routes.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'feature_magic_ball_prediction/data/data_sources/prediction_service.dart';
import 'feature_magic_ball_prediction/data/repositories/prediction_repository.dart';
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
    /// В дальнейшем можно будет добавлять другие блоки
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                PredictionBloc(PredictionRepository(PredictionNetworkService.instance))),
      ],
      /// Запрет на изменение размера шрифта через системные настройки
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
          theme: createLightTheme(),
          darkTheme: createDarkTheme(),
          themeMode: ThemeMode.system,
        ),
      ),
    );
  }
}
