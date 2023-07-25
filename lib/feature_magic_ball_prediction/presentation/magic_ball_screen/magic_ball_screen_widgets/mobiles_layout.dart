import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/bloc/prediction_bloc.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/bloc/prediction_events.dart';
import 'package:surf_practice_magic_ball/helpers/screen_options.dart';

import '../../../../config/themes/app_colors.dart';
import '../../bloc/prediction_state.dart';

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
    return BlocProvider.value(
      value: BlocProvider.of<PredictionBloc>(context),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenOptions.h(177)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () =>
                      context.read<PredictionBloc>().add(GetPredictionEvent()),
                  child: Image.asset(_platformBrightness == Brightness.dark
                      ? 'assets/images/mobiles_assets/dark_theme/prediction_orb.png'
                      : 'assets/images/mobiles_assets/light_theme/prediction_orb.png'),
                ),
                BlocBuilder<PredictionBloc, PredictionState>(
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        context
                            .read<PredictionBloc>()
                            .state
                            .currentPrediction
                            .reading,

                        /// TODO: Добавить height
                        style: TextStyle(
                            color: _platformBrightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenOptions.sp(32)),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenOptions.h(177)),
            child: Text('Нажмите на шар\n или потрясите телефон',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenOptions.sp(16),
                    height: 18.38 / ScreenOptions.sp(16),

                    /// TODO: Заменить цвет текста на тему
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppDarkThemeColors.additionalText
                        : AppLightThemeColors.additionalText)),
          )
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
