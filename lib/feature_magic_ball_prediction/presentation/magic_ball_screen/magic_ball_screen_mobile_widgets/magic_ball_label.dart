import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../helpers/screen_options.dart';

class MagicBallLabel extends StatelessWidget {
  const MagicBallLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: ScreenOptions.h(56), top: ScreenOptions.h(59)),
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
    );
  }
}
