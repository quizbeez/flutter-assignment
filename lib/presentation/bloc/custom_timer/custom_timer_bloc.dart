import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_event.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_state.dart';

import '../../models/custom_timer.dart';

class CustomTimerBloc extends Bloc<CustomTimerEvent, CustomTimerState> {
  final CustomTimer _customTimer;
  static const _duration = 20;

  static const _question = 0;

  StreamSubscription<int>? _streamSubscription;

  CustomTimerBloc({
    required CustomTimer customTimer,
  })  : _customTimer = customTimer,
        super(
          const CustomTimerInitialValue(
            _duration,
            _question,
          ),
        ) {
    on<TimerStarted>(_onStarted);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<CustomTimerState> emit) {
    _streamSubscription?.cancel();

    emit(CustomTimerInProgress(
      event.duration,
      event.question,
    ));
    _streamSubscription = _customTimer
        .getTime(
          value: event.duration,
          question: event.question,
        )
        .listen(
          (duration) => add(
            TimerTicked(
              duration,
              _customTimer.getQuestion(
                question: event.question,
              ),
            ),
          ),
        );
  }

  void _onTicked(TimerTicked event, Emitter<CustomTimerState> emit) {
    emit(
      event.duration > 0
          ? CustomTimerInProgress(
              event.duration,
              event.question,
            )
          : CustomTimerComplete(
              question: event.question,
            ),
    );
  }

  void _onReset(TimerReset event, Emitter<CustomTimerState> emit) {
    _streamSubscription?.cancel();
    emit(
      const CustomTimerInitialValue(
        _duration,
        _question,
      ),
    );
  }
}
