import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/screen_options.dart';
import '../../bloc/prediction_bloc.dart';
import '../../bloc/prediction_events.dart';
import '../../bloc/prediction_state.dart';

class MagicBall extends StatefulWidget {
  final Brightness platformBrightness;
  const MagicBall({required this.platformBrightness, super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PredictionBloc>(context),
      child: Padding(
        padding: EdgeInsets.only(top: ScreenOptions.h(180)),
        child: GestureDetector(
          onTap: () => context.read<PredictionBloc>().add(GetPredictionEvent()),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(widget.platformBrightness == Brightness.dark
                  ? 'assets/images/mobiles_assets/dark_theme/prediction_orb.png'
                  : 'assets/images/mobiles_assets/light_theme/prediction_orb.png'),
              Image.asset(widget.platformBrightness == Brightness.dark
                  ? 'assets/images/mobiles_assets/dark_theme/orbs_small_stars.png'
                  : 'assets/images/mobiles_assets/light_theme/orbs_small_stars.png'),
              Image.asset(
                widget.platformBrightness == Brightness.dark
                    ? 'assets/images/mobiles_assets/dark_theme/orbs_stars.png'
                    : 'assets/images/mobiles_assets/light_theme/orbs_stars.png',
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
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: widget.platformBrightness == Brightness.dark
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
      ),
    );
  }
}
