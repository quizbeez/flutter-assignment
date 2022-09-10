import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'trivia_event.dart';

part 'trivia_state.dart';

part 'trivia_bloc.freezed.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  TriviaBloc() : super(TriviaState.initial()) {
    on<_TriviaEventNext>((event, emit) {
      if (state.index < 1) {
        emit(
          state.copyWith(
            index: state.index + 1,
            answerState: const AnswerState.initial(),
          ),
        );
      }
    });

    on<_TriviaEventAnswer>((event, emit) {
      if (event.answer == state.questions[state.index]["correct"]) {
        emit(
          state.copyWith(
            answerState: const AnswerState.correct(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            answerState: const AnswerState.inCorrect(),
          ),
        );
      }
      add(TriviaEvent.next());
    });

    on<_TriviaEventTimeout>((event, emit) {
      if (state.index < 1) {
        emit(
          state.copyWith(
            index: state.index + 1,
            answerState: const AnswerState.unAnswered(),
          ),
        );
      }
    });
  }
}
