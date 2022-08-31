class Question {
  String text;
  List<String> answers;
  String correct;
  List<String> incorrect;

  Question({
    required this.text,
    required this.correct,
    required this.incorrect,
  }) : answers = [...incorrect, correct]..shuffle();
}
