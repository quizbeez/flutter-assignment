import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/bloc/timer_bloc.dart';
import 'package:flutter_home_assignment/models/quiz_options.dart';
import 'package:flutter_home_assignment/utl/ticker.dart';
import 'package:flutter_home_assignment/widgets/option_widget.dart';
import 'package:flutter_home_assignment/widgets/bloc_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Column(
            children: const <Widget>[
              Expanded(child: QuestionWidget()),
              TimerBlocActions(),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController controller;
  int _questionsNumber = 1;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    if (duration == 1) {
      _questionsNumber++;
      controller.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInExpo);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(5),
            foregroundDecoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: LinearProgressIndicator(
                value: duration / 10,
                color: Colors.lightGreen,
                backgroundColor: Colors.grey[200],
                minHeight: 13,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Text('Question $_questionsNumber')),
          Center(child: Image.asset('assets/brain.png', height: 200)),
          Expanded(
              child: PageView.builder(
            controller: controller,
            itemCount: questions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final question = questions[index];
              return buildQuestion(question);
            },
          )),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text(question.text, style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 12),
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (Option option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
            }
          },
        ))
      ],
    );
  }
}
