
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_home_assignment/mock_data.dart';
import 'package:flutter_home_assignment/models/question.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  late AnimationController animationController;
  @override
  Future<void> close() async {
    super.close();
    animationController.dispose();
  }
  QuestionsBloc({required this.animationController, required BuildContext context}) : super(QuestionsInitial()) {
    animationController.addListener(() {
      if(animationController.status == AnimationStatus.completed){
        if(state is QuestionsLoaded){
          final state = this.state as QuestionsLoaded;
          if(state.currentPage == state.questions.length -1){
            Navigator.pop(context);
          }
          else{
            add(AddAnswer(answer: state.questions[state.currentPage].choices[0]));
          }
        }
        animationController.reset();
        animationController.forward();
      }
      else{
        add(AddFactor(factor: animationController.value));
      }
    });
    animationController.forward();

    on<LoadQuestions>((event, emit) {
      List<Question> questions = [];
      for(final json in kQuestions){
        questions.add(Question.fromJson(json));
      }
      emit(QuestionsLoaded(questions: questions));
    });

    on<AddFactor>((event,emit){
      final state = this.state as QuestionsLoaded;
      emit(QuestionsLoaded(questions: List.from(state.questions),answers: List.from(state.answers),currentPage: state.currentPage, factor: event.factor));
    });

    on<AddAnswer>((event,emit){
      if(state is QuestionsLoaded){
        animationController.reset();
        animationController.forward();
        final state = this.state as QuestionsLoaded;
        emit(QuestionsLoaded(questions: List.from(state.questions),answers: List.from(state.answers)..add(event.answer),currentPage: state.currentPage + 1));
      }
    });
  }
}
