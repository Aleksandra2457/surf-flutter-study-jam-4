import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surf_practice_magic_ball/helpers/screen_options.dart';

/// Класс для отображения шара предсказания для мобильных устройств
class MagicBallScreenMobileLayout extends StatefulWidget {
  const MagicBallScreenMobileLayout({super.key});

  @override
  State<MagicBallScreenMobileLayout> createState() =>
      _MagicBallScreenMobileLayoutState();
}

class _MagicBallScreenMobileLayoutState
    extends State<MagicBallScreenMobileLayout> {
  late Brightness _platformBrightness;

  @override
  void initState() {
    _firstCheckThePlatformSystemMode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _checkThePlatformCurrentSystemMode(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ScreenOptions.h(180)),
          child: Stack(
            children: [
              Image.asset(_platformBrightness == Brightness.dark
                  ? 'assets/images/mobiles_assets/dark_theme/prediction_orb.png'
                  : 'assets/images/mobiles_assets/light_theme/prediction_orb.png')
            ],
          ),
        )
      ],
    );
  }

  /// Первая проверка текущего оформления системы
  void _firstCheckThePlatformSystemMode() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _platformBrightness = brightness;
  }

  /// Проверка текущего оформления системы для изменения UI
  void _checkThePlatformCurrentSystemMode(BuildContext context) {
    if (_platformBrightness != Theme.of(context).brightness) {
      setState(() {
        _platformBrightness = Theme.of(context).brightness;
      });
    }
  }
}
