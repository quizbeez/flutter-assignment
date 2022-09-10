import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/question_one_bloc.dart';
import 'package:flutter_home_assignment/screen/question2/bloc/question_two_state.dart';
import 'package:flutter_home_assignment/screen/question2/bloc/quetion_two_event.dart';
import 'package:flutter_home_assignment/screen/question2/question_two.dart';

class QuestionTwoBloc extends Bloc<QuestionTwoEvent, QuestionTwoState> {
  QuestionTwoBloc() : super(QuestionTwoState()) {
    on<OnStart>(onStart);
    on<OnStoreSecondAns>(onStoreSecondAns);

  }

  FutureOr<void> onStart(OnStart event, Emitter<QuestionTwoState> emit) {
    final timer = Timer(const Duration(seconds: 10), () {
      navigatorKey.currentState!
          .push(MaterialPageRoute(builder: (context) => const QuestionTWO()));
    });
  }
  FutureOr<void> onStoreSecondAns(OnStoreSecondAns event,Emitter<QuestionTwoState> emit){
    List<bool> list = [
      false,
      false,
      false,
      false,
    ];
    list[event.index!] = true;
    //print(list);
    emit(state.copywith(text: event.text,list: list));


  }
}
