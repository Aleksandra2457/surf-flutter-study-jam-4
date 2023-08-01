import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/magic_ball_screen/magic_ball_screen_mobile_widgets/magic_ball_label.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/magic_ball_screen/magic_ball_screen_mobile_widgets/magic_ball_shade.dart';

import 'magic_ball_screen_mobile_widgets/magic_ball.dart';

/// Класс для отображения шара предсказания для мобильных устройств
class MagicBallScreenTabletsBody extends StatefulWidget {
  const MagicBallScreenTabletsBody({super.key});

  @override
  State<MagicBallScreenTabletsBody> createState() =>
      _MagicBallScreenTabletsBodyState();
}

class _MagicBallScreenTabletsBodyState
    extends State<MagicBallScreenTabletsBody> {
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
    return SafeArea(
      child: Column(
        children: [
          MagicBall(platformBrightness: _platformBrightness),
          MagicBallShade(platformBrightness: _platformBrightness),
          const MagicBallLabel()
        ],
      ),
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
