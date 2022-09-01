import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/core/model/question.dart';
import 'package:flutter_home_assignment/ui/quiz/quiz_bloc.dart';
import 'package:flutter_home_assignment/ui/widget/timer_widget.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizTimerState) {
          context.findAncestorStateOfType<TimerState>()?.reset();
        }
      },
      builder: (context, state) {
        if (state is QuizQuestionState) {
          return _showQuestion(context, state.question!);
        } else if (state is QuizAnswerState) {
          return _showAnswer(context, state.question!, state.isCorrect!);
        } else {
          return _showFinished(context);
        }
      },
    );
  }

  Widget _showQuestion(BuildContext context, Question question) {
    final bloc = context.read<QuizBloc>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.score),
                Text("100"),
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            TimerWidget(onExpired: () => _onExpired(context)),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Question 1", textAlign: TextAlign.center),
            ),
            const Spacer(),
            Image.asset('assets/brain.png', height: 300),
            const Spacer(),
            Text(question.text),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[0]));
              },
              child: Text(question.answers[0]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[1]));
              },
              child: Text(question.answers[1]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[2]));
              },
              child: Text(question.answers[2]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[3]));
              },
              child: Text(question.answers[3]),
            ),
          ],
        ),
      ),
    );
  }

  void _onExpired(BuildContext context) {
    context.read<QuizBloc>().add(QuizGoNextEvent());
  }

  void _onGoNextPressed(BuildContext context) {
    context.read<QuizBloc>().add(QuizGoNextEvent());
  }

  Widget _showAnswer(BuildContext context, Question question, bool isCorrect) {
    final bloc = context.read<QuizBloc>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.score),
                Text("100"),
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            TimerWidget(onExpired: () => _onExpired(context)),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Question 1", textAlign: TextAlign.center),
            ),
            const Spacer(),
            Image.asset('assets/brain.png', height: 300),
            const Spacer(),
            Text(question.text),
            const Spacer(),
            Row(
              children: [
                isCorrect
                    ? Text(style: TextStyle(color: Colors.green), "Correct")
                    : Text(style: TextStyle(color: Colors.red), "Incorrect"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _onGoNextPressed(context),
                  child: Text("Go next"),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[0]));
              },
              child: Text(question.answers[0]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[1]));
              },
              child: Text(question.answers[1]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[2]));
              },
              child: Text(question.answers[2]),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(QuizSubmitAnswerEvent(question.answers[3]));
              },
              child: Text(question.answers[3]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showFinished(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.score),
                Text("100"),
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: const Center(
          child: Text("Quiz finished"),
        ),
      ),
    );
  }
}
