import 'dart:convert';

import '../models/prediction.dart';
import 'package:http/http.dart' as http;

abstract class PredictionService {
  getPrediction();
}

class PredictionNetworkService implements PredictionService {
  static final _instance = PredictionNetworkService._internal();

  PredictionNetworkService._internal();

  static PredictionNetworkService get instance => _instance;

  @override
  Future<Prediction> getPrediction() async {
    late Prediction currentPrediction;
    try {
      var response = await http.get(Uri.parse('https://eightballapi.com/api'));
      var decodedResponse = await json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200) {
        /// На этом этапе можно записывать логи в крашлитику по коду ответа
        currentPrediction = const Prediction(
            reading: '', predictionStatus: PredictionStatus.error);
        return currentPrediction;
      }
      currentPrediction = Prediction.fromJson(decodedResponse);
    } catch (error) {
      /// На этом этапе можно записывать логи в крашлитику о другой ошибке (напр. сериализация)
      currentPrediction = const Prediction(
          reading: '', predictionStatus: PredictionStatus.error);
    }
    return currentPrediction;
  }
}
