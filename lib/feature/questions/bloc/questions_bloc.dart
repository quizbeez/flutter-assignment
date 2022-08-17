import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import '../../../common/model/questions_model.dart';
import 'bloc_questions.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionInitial()) {
    on<InitialQuestionEvent>((event, emit) async {
      try {
        emit(QuestionLoading());
        questions.clear();
        questions
            .addAll(kQuestions.map((m) => QuestionsModel.fromJson(m)).toList());
        emit(QuestionSuccess(questions: questions));
      } catch (e) {
        emit(QuestionFailure(error: e.toString()));
      }
    });
    on<NextQuestionEvent>((event, emit) async {
      selectedPage = event.selectedPage;
      emit(NextQuestionSuccess(selectedPage: selectedPage));
    });
    on<IncreaseScoreEvent>((event, emit) async {
      if (score < totalScore) {
        score += totalScore ~/ questions.length;
      }
      emit(const IncreaseScoreSuccess());
    });
  }

  List<QuestionsModel> questions = [];
  int selectedPage = 0;
  int score = 0;
  int totalScore = 100;
}
