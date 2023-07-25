import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/helpers/screen_options.dart';
import 'config/routes/routes.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatefulWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: createLightTheme(),
      darkTheme: createDarkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
