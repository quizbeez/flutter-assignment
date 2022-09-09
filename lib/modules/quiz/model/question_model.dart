class QuestionModel{
  String? text;
  List<String>? answers;
  String? correct;
  List<String>? incorrect;

  QuestionModel({this.text, required this.answers, this.correct, this.incorrect});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    correct = json['correct'];
    List<String> values = [];
    for (var answer in json['incorrect']) {
      values.add(answer);
    }
    incorrect = values;
    values.add(correct!);
    values.shuffle();
    answers = values;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['text'] = text;
    data['correct'] = correct;
    data['incorrect'] = incorrect;
    return data;
  }
}
