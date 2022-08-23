import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/modules/quiz/cubit/quiz_cubit.dart';
import 'package:flutter_home_assignment/modules/quiz/views/quiz_view.dart';

void main() {
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(),
        )
      ],
      child: const MaterialApp(
        home: QuizView(),
      ),
    );
  }
}
