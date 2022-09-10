import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/screen/question1/widget/widget.dart';
import 'package:flutter_home_assignment/screen/question2/bloc/question_two_bloc.dart';
import 'package:flutter_home_assignment/screen/question2/bloc/question_two_state.dart';
import 'package:flutter_home_assignment/screen/question2/bloc/quetion_two_event.dart';

class QuestionTWO extends StatefulWidget {
  const QuestionTWO({Key? key}) : super(key: key);

  @override
  State<QuestionTWO> createState() => _QuestionTWOState();
}

class _QuestionTWOState extends State<QuestionTWO> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    context.read<QuestionTwoBloc>().add(OnStart());

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 40,
                    ),
                    BlocBuilder<QuestionTwoBloc, QuestionTwoState>(
                        builder: (context, state) =>  Row(
                          children:  [
                            Text(
                              state.ans ==  "Sending Bitcoin to someone else" ?"Score 100":"Score 0",
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                child: LinearProgressIndicator(
                  value: controller.value,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/images.png"),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      "Which of the following is an example of a trustless transaction that takes place on Web 3.0?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<QuestionTwoBloc, QuestionTwoState>(
                      builder: (context, state) => Column(
                        children: [
                          ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      context.read<QuestionTwoBloc>().add(
                                          OnStoreSecondAns(
                                              text: state.suggest[index],
                                              index: index));
                                    },
                                    child: ansBox(context, state.suggest[index],
                                        state.suggestedChoice![index]));
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          state.ans != ""
                              ? (state.ans ==
                              "Sending Bitcoin to someone else"
                              ? const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This is The Correct Answer",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                              : const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "This is The Wrong Answer",
                                textAlign: TextAlign.start,
                              )))
                              : const SizedBox(),

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
