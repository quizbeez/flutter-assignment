import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/questions/bloc/questions_event.dart';
import 'package:flutter_home_assignment/questions/bloc/questions_state.dart';
import 'package:flutter_home_assignment/utils/imagePath.dart';

import '../../components/widgets.dart';
import '../bloc/questions_bloc.dart';
import '../model/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuestionsBloc questionsBloc;
  PageController pageController = PageController();
  List<QuestionModel> questions = [];

  @override
  void initState() {
    BlocProvider.of<QuestionsBloc>(context).add(FirstQuestionEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    questionsBloc = BlocProvider.of<QuestionsBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
      if (state is QuestionSuccess) {
        questions = state.questions;
      }
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Question ${questionsBloc.selectedQuestion + 1}',
              style: const TextStyle(color: Colors.black),
            ),
            leading: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            actions: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15, right: 10, left: 20),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '${questionsBloc.score}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13,
                    right: 50,
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(ImagePath.coins)),
                  )
                ],
              )
            ],
          ),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (int i) {
              BlocProvider.of<QuestionsBloc>(context)
                  .add(NextQuestionEvent(selectedQuestion: i));
            },
            itemBuilder: (context, pageIndex) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        brainImage(),
                        question(
                          questions[pageIndex].questions ?? "",context
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        questions[pageIndex].options != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: questions[pageIndex].options!.length,
                                itemBuilder: (context, index) {
                                  return OptionList(
                                    options:
                                        questions[pageIndex].options![index],
                                    onTap: () {
                                      if (questions[pageIndex].answer ==
                                          index.toString()) {
                                        questionsBloc.add(ScoreEvent());
                                      }
                                      nextQuestion();
                                    },
                                  );
                                })
                            : Container(),
                      ]),
                ),
              );
            },
          ));
    });
  }

  void nextQuestion() {
    if (questionsBloc.selectedQuestion < (questions.length - 1)) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}
