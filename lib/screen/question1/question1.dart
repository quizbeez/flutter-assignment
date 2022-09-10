import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/question_one_bloc.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/question_one_event.dart';
import 'package:flutter_home_assignment/screen/question1/bloc/quetion_one_state.dart';
import 'package:flutter_home_assignment/screen/question1/widget/widget.dart';

class QuestionOneScreen extends StatefulWidget {
  const QuestionOneScreen({Key? key}) : super(key: key);

  @override
  State<QuestionOneScreen> createState() => QuestionOneScreenState();
}

class QuestionOneScreenState extends State<QuestionOneScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        // setState(() {});
      });
    controller.repeat(reverse: false);
    context.read<QuestionBloc>().add(OnInit());

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
                BlocBuilder<QuestionBloc, QuestionOneState>(
                  builder: (context, state) =>  Row(
                    children:  [
                      Text(
                       state.ans ==  "Blockchains can use a lot of energy" ?"Score 100":"Score 0",
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ))
                  ],
                ),
              ),
              const SizedBox(height: 5,),
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
                      "What is one potential environmental concern about Web 3.0?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<QuestionBloc, QuestionOneState>(
                      builder: (context, state) => Column(
                        children: [
                          ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      context.read<QuestionBloc>().add(
                                          OnStoreAns(
                                              text: state.suggest[index],
                                              index: index));
                                    },
                                    child: ansBox(context, state.suggest[index],
                                        state.suggestChoice![index]));
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          state.ans != ""
                              ? (state.ans ==
                                      "Blockchains can use a lot of energy"
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: (){
                                context.read<QuestionBloc>().add(NextPage());
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFA020F0),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
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
