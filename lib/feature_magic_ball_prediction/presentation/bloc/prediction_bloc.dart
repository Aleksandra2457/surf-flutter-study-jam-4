import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/bloc/prediction_events.dart';
import 'package:surf_practice_magic_ball/feature_magic_ball_prediction/presentation/bloc/prediction_state.dart';

import '../../data/models/prediction.dart';
import '../../data/repositories/prediction_repository.dart';

class PredictionBloc extends Bloc<PredictionEvent, PredictionState> {
  final PredictionRepository _predictionRepository;

  PredictionBloc(this._predictionRepository)
      : super(PredictionState(
            currentPrediction: const Prediction(reading: ''))) {
    on<GetPredictionEvent>(_getPredictionEventHandler);
    on<RemoveCurrentPredictionEvent>(_removeCurrentPredictionEventHandler);
  }

  void _getPredictionEventHandler(
      PredictionEvent event, Emitter<PredictionState> emit) async {
    late Prediction currentPrediction;
    if (event is GetPredictionEvent) {
      currentPrediction = await _predictionRepository.getPrediction();
    }
    emit(PredictionState(currentPrediction: currentPrediction));
  }
  
  void _removeCurrentPredictionEventHandler(
      PredictionEvent event, Emitter<PredictionState> emit) {
    emit(PredictionState(
        currentPrediction: const Prediction(reading: '')));
  }
}
