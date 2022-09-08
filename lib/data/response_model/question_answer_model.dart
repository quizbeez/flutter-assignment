class QuestionAnswerModel {
  List<String> incorrect;
  String text;
  String correct;

  QuestionAnswerModel({
    required this.incorrect,
    required  this.text,
    required  this.correct,
  });

  factory QuestionAnswerModel.fromJson(Map<String, dynamic> json) => QuestionAnswerModel(
    incorrect: List<String>.from(json["incorrect"].map((x) => x)),
    text: json["text"],
    correct: json["correct"],
  );

  Map<String, dynamic> toJson() => {
    "incorrect": List<dynamic>.from(incorrect.map((x) => x)),
    "text": text,
    "correct": correct,
  };
}