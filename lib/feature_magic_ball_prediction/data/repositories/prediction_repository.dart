import '../data_sources/prediction_service.dart';
import '../models/prediction.dart';

class Repository {
  final PredictionService _predictionService;

  Repository(this._predictionService);

  Future<Prediction> getPrediction() async  {
    Prediction prediction = await _predictionService.getPrediction();
    return prediction;
  }
}