import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/res/app_assets.dart';
import 'package:flutter_home_assignment/res/app_colors.dart';
import 'package:flutter_home_assignment/res/app_strings.dart';
import 'package:flutter_home_assignment/res/text_styles.dart';
import 'package:flutter_home_assignment/views/questions/questions_bloc/questions_bloc.dart';
import 'package:flutter_home_assignment/views/questions/widgets/answer_button.dart';
import 'package:flutter_home_assignment/views/questions/widgets/question_timer.dart';
import 'package:flutter_home_assignment/views/questions/widgets/remaining_coins.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close,color: AppColors.darkGrey,size: 36),
        ),
        actions: const [RemainingCoins()],
        backgroundColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) => QuestionsBloc(context: context,animationController: AnimationController(vsync: this,duration: const Duration(seconds: 5)),)..add(LoadQuestions()),
        child: BlocBuilder<QuestionsBloc,QuestionsState>(
          builder: (context, state) {
            
            if(state is QuestionsLoaded){
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    QuestionTimer(factor: state.factor),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6)),
                          color: AppColors.grey,
                        ),
                        child: BorderedText(
                          strokeWidth: 1,
                          strokeColor: Colors.black,
                          child: Text(
                            "${AppStrings.question} ${state.currentPage + 1}",
                            style:kQuestionLabelTextStyle
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(AppAssets.brainAsset,fit: BoxFit.fitWidth,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.questions[state.currentPage].question,style: kQuestionTextStyle,),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for(int index = 0; index < state.questions[state.currentPage].choices.length;index++)
                              AnswerButton(answer: state.questions[state.currentPage].choices[index], onTap: (){
                                if(state.currentPage == state.questions.length - 1){
                                  Navigator.pop(context);
                                }
                                else{
                                  context.read<QuestionsBloc>().add(AddAnswer(answer: state.questions[state.currentPage].choices[index]));
                                }
                              })
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + 8,)
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator(color: AppColors.purple,),);
          },
        ),
      )
    );
  }
}