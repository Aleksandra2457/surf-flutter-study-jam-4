import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../helpers/screen_options.dart';
import '../../bloc/prediction_bloc.dart';
import '../../bloc/prediction_events.dart';
import '../../bloc/prediction_state.dart';

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
    return BlocProvider.value(
      value: BlocProvider.of<PredictionBloc>(context),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenOptions.h(286)),
            child: GestureDetector(
              onTap: () =>
                  context.read<PredictionBloc>().add(GetPredictionEvent()),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(_platformBrightness == Brightness.dark
                      ? 'assets/images/tablets_and_desktops_assets/dark_theme/prediction_orb.png'
                      : 'assets/images/tablets_and_desktops_assets/light_theme/prediction_orb.png'),
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
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: _platformBrightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenOptions.sp(56)),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenOptions.h(177)),
            child: Text('Нажмите на шар\n или потрясите телефон',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenOptions.sp(32),
                    height: 34 / ScreenOptions.sp(32),

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
