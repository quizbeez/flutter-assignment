class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;
  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(text: 'How much of your brain do you use?', options: [
    const Option(isCorrect: true, text: '10%'),
    const Option(isCorrect: false, text: '20%'),
    const Option(isCorrect: false, text: 'all of it'),
    const Option(isCorrect: false, text: '50%')
  ]),
  Question(text: 'New ?', options: [
    const Option(isCorrect: true, text: '10%'),
    const Option(isCorrect: false, text: '20%'),
    const Option(isCorrect: false, text: 'all of it'),
    const Option(isCorrect: false, text: '50%')
  ])
];
