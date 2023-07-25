import '../data_sources/prediction_service.dart';
import '../models/prediction.dart';

class PredictionRepository {
  final PredictionService _predictionService;

  PredictionRepository(this._predictionService);

  Future<Prediction> getPrediction() async  {
    Prediction prediction = await _predictionService.getPrediction();
    return prediction;
  }
}