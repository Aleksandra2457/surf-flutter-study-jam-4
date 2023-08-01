import 'package:flutter/material.dart';

class MagicBallShade extends StatefulWidget {
  final Brightness platformBrightness;

  const MagicBallShade({required this.platformBrightness, super.key});

  @override
  State<MagicBallShade> createState() => _MagicBallShadeState();
}

class _MagicBallShadeState extends State<MagicBallShade> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Image.asset(
            widget.platformBrightness == Brightness.dark
                ? 'assets/images/mobiles_assets/dark_theme/prediction_orbs_shade.png'
                : 'assets/images/mobiles_assets/light_theme/prediction_orbs_shade.png',
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Image.asset(
            widget.platformBrightness == Brightness.dark
                ? 'assets/images/mobiles_assets/dark_theme/prediction_orbs_small_shade.png'
                : 'assets/images/mobiles_assets/light_theme/prediction_orbs_small_shade.png',
          ),
        ),
      ],
    );
  }
}
