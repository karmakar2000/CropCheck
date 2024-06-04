class ModelResult {
  String modelResultClass;
  double confidence;
  String solution;

  ModelResult({
    required this.modelResultClass,
    required this.confidence,
    required this.solution,
  });

  factory ModelResult.fromJson(Map<String, dynamic> json) => ModelResult(
        modelResultClass: json["class"],
        confidence: json["confidence"]?.toDouble(),
        solution: json["solution"],
      );

  Map<String, dynamic> toJson() => {
        "class": modelResultClass,
        "confidence": confidence,
        "solution": solution,
      };
}
