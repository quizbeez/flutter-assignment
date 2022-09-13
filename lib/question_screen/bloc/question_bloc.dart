import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionState()) {
    on<RefreshDataTimer>((event, emit) async {
      emit(state.copyWith(
          currentIndex: event.currentIndex,
          currentTimer: event.currentTimer,
          mcqList: event.mcqList));
    });
  }
}
