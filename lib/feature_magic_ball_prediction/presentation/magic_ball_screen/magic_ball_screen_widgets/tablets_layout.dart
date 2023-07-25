import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../helpers/screen_options.dart';

/// Класс для отображения шара предсказания для планшетов и десктопных устройств
class MagicBallScreenTabletsLayout extends StatefulWidget {
  const MagicBallScreenTabletsLayout({super.key});

  @override
  State<MagicBallScreenTabletsLayout> createState() =>
      _MagicBallScreenTabletsLayoutState();
}

class _MagicBallScreenTabletsLayoutState
    extends State<MagicBallScreenTabletsLayout> {
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
                  ? 'assets/images/tablets_and_desktops_assets/dark_theme/prediction_orb.png'
                  : 'assets/images/tablets_and_desktops_assets/light_theme/prediction_orb.png')
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
