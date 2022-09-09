class QuestionAnswers {
  List<String>? incorrect;
  String? text;
  String? correct;

  QuestionAnswers({this.incorrect, this.text, this.correct});

  QuestionAnswers.fromJson(Map<String, dynamic> json) {
    incorrect = json['incorrect'].cast<String>();
    text = json['text'];
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incorrect'] = this.incorrect;
    data['text'] = this.text;
    data['correct'] = this.correct;
    return data;
  }
}
