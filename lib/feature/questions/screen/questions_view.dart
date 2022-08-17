import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/common/constant/colors.dart';
import 'package:flutter_home_assignment/common/constant/images.dart';
import '../../../common/model/questions_model.dart';
import '../bloc/questions_bloc.dart';
import '../bloc/questions_event.dart';
import '../bloc/questions_state.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  late QuestionsBloc questionsBloc;
  List<QuestionsModel> questions = [];
  PageController pageController = PageController();

  @override
  void initState() {
    BlocProvider.of<QuestionsBloc>(context).add(InitialQuestionEvent());
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
          appBar: AppBar(
            backgroundColor: whiteColor,
            title: Text(
              "Questions(${questionsBloc.selectedPage + 1}/${questions.length})",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 10),
                child: Text(
                  "${questionsBloc.score}/${questionsBloc.totalScore}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            ],
          ),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (int i) {
              BlocProvider.of<QuestionsBloc>(context)
                  .add(NextQuestionEvent(selectedPage: i));
            },
            itemBuilder: (context, pageIndex) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Center(
                        child:
                            SizedBox(height: 150, child: Image.asset(icBrain))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      questions[pageIndex].question ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    questions[pageIndex].options != null
                        ? ListView.separated(
                            padding: const EdgeInsets.only(top: 20),
                            itemCount: questions[pageIndex].options!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OptionItem(
                                option: questions[pageIndex].options![index],
                                onClick: () {
                                  if (questions[pageIndex].answer ==
                                      index.toString()) {
                                    questionsBloc.add(IncreaseScoreEvent());
                                  }
                                  goToNextQuestion();
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          )
                        : Container()
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void goToNextQuestion() {
    if (questionsBloc.selectedPage < (questions.length - 1)) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      print("Not allowed");
    }
  }
}

class OptionItem extends StatelessWidget {
  final String? option;
  final VoidCallback? onClick;

  const OptionItem({Key? key, this.option, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: optionButtonColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            option ?? "",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor),
          ),
        ),
      ),
    );
  }
}
