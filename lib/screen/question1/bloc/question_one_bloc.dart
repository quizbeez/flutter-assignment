import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/question_one_event.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/quetion_one_state.dart';
import 'package:flutter_home_assignment/screen/question2/question_two.dart';
import 'package:fluttertoast/fluttertoast.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class QuestionBloc extends Bloc<QuestionOneEvent, QuestionOneState> {
  QuestionBloc() : super(QuestionOneState()) {
    on<OnInit>(init);
    on<OnStoreAns>(onStoreAns);
    on<NextPage>(onNextPage);
  }

  FutureOr<void> init(OnInit event, Emitter<QuestionOneState> emit) {
    final timer = Timer(const Duration(seconds: 10), () {
      navigatorKey.currentState!
          .push(MaterialPageRoute(builder: (context) => const QuestionTWO()));
    });
  }
  FutureOr<void> onStoreAns(OnStoreAns event,Emitter<QuestionOneState> emit){
    List<bool> list = [
      false,
      false,
      false,
      false,
    ];
    list[event.index!] = true;

    emit(state.copywith(text: event.text,list: list));

  }
  FutureOr<void>onNextPage(NextPage event,Emitter<QuestionOneState> emit){
    if(state.ans == ""){
      Fluttertoast.showToast(msg: 'Please Choose At least One Answer');
    }else{
      navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>const QuestionTWO()));
    }


  }
}
