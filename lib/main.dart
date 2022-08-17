import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'feature/questions/bloc/questions_bloc.dart';

void main() {
  final MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<QuestionsBloc>(
        create: (BuildContext context) => QuestionsBloc(),
      ),
    ],
    child: const MyApp(),
  );
  runApp(blocProvider);
}
