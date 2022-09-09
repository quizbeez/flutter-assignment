import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_home_assignment/questions/bloc/questions_event.dart';
import 'package:flutter_home_assignment/questions/bloc/questions_state.dart';

import '../model/question_model.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionInitial()) {
    on<FirstQuestionEvent>((event, emit) async {
      try {
        emit(QuestionLoading());
        questions.clear();
        questions
            .addAll(kQuestions.map((e) => QuestionModel.fromJson(e)).toList());
        emit(QuestionSuccess(questions: questions));
      } catch (e) {
        emit(QuestionFailure(error: e.toString()));
      }
    });
    on<NextQuestionEvent>((event, emit) async {
      selectedQuestion = event.selectedQuestion;
      emit(NextQuestionSuccess(selectedQuestion: selectedQuestion));
    });
    on<ScoreEvent>((event, emit) async {
      if (score < totalScore) {
        score += totalScore ~/ questions.length;
      }
      emit(ScoreSuccess());
    });
  }

  List<QuestionModel> questions = [];
  int selectedQuestion = 0;
  int score = 0;
  int totalScore = 100;
}
