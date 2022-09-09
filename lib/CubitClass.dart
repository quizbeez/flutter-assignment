
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'QuestionAnswersModule/QuestionAnswersModule.dart';
import 'button_widgets/button_widget.dart';
import 'mock_data.dart';

class CartBloc with ChangeNotifier {
  List<Widget> incorrectButton = [];
  int currentIndex = 0;
  QuestionAnswers? res;


  updateQuestion(){
     res = QuestionAnswers.fromJson(kQuestions[currentIndex]);
    incorrectButton =  List.generate(res?.incorrect?.length ?? 0, (index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 50.h,
          width: 1*0.80.sw,
          child: AnswerButtons( text: res?.incorrect![index], onTap: (){
            updateValue();
            // setState((){});
          },)),
    ));
    incorrectButton.insert(2, Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 50.h,
          width: 1*0.80.sw,
          child: AnswerButtons( text: res?.correct,onTap: (){
            updateValue();
            // setState((){});
          },)),
    ));


  }

  updateValue(){
    if(currentIndex == 0){
      currentIndex = 1;
      notifyListeners();
    }else{
      currentIndex = 0;
      notifyListeners();
    }
    print("working");

  }

}