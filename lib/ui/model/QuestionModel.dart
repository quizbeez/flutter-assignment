class QuestionModel{
  List<String>? incorrect;
  String? text;
  String? correct;
  List<String>? answers;

  QuestionModel({this.incorrect, this.text, this.correct, required this.answers});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    List<String> values = [];
    for (var answer in json['incorrect']) {
      values.add(answer);
    }
    incorrect = values;
    text = json['text'];
    correct = json['correct'];
    values.add(correct!);
    values.shuffle();
    answers = values;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['incorrect'] = incorrect;
    data['text'] = text;
    data['correct'] = correct;
    return data;
  }
}