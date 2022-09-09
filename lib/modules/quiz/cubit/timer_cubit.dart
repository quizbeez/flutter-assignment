import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? countdownTimer;
  int secondRemain=0;

  TimerCubit() : super(InitialTimer());

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    secondRemain=0;
    countdownTimer?.cancel();
    emit(TimerStop());
  }

  void resetTimer() {
   // stopTimer();
    secondRemain=0;
  }

  void setCountDown() {
    secondRemain++;

    if (secondRemain >= 61) {
      countdownTimer?.cancel();
      emit(TimerFinish());
    } else {
      emit(CountDown(secondRemain: secondRemain));
    }
  }

}
