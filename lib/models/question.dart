import 'package:equatable/equatable.dart';

class Question extends Equatable{
  final List<String> choices;
  final String question;
  final String answer;

  const Question({required this.choices,required this.answer,required this.question});

  factory Question.fromJson(Map<String,dynamic> json){
    return Question(choices: json["choices"], answer: json["answer"], question: json["question"]);
  }

  Map<String,dynamic> toJson() => {"choices": choices, "answer": answer, "question": question};

  @override 
  List<Object?> get props => [choices,question,answer];
}