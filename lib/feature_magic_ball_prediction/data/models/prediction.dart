enum PredictionStatus { success, error }

class Prediction {
  final String reading;
  final PredictionStatus predictionStatus;

  const Prediction(
      {required this.reading,
      this.predictionStatus = PredictionStatus.success});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      reading: json['reading'] ?? '',
    );
  }
}
