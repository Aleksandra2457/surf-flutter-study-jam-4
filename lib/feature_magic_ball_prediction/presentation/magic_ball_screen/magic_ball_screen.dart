import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/magic_ball_screen/magic_ball_screen_tablets_body.dart';

import 'magic_ball_screen_mobile_body.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ])),
        /// Проверяем размеры устройства для отображения шара предсказания
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 850) {
              return const MagicBallScreenMobileBody();
            } else {
              return const MagicBallScreenTabletsBody();
            }
          },
        ),
      ),
    );
  }
}
