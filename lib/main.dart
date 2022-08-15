import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/presentation/bloc/custom_timer/custom_timer_bloc.dart';
import 'package:flutter_home_assignment/presentation/models/custom_timer.dart';
import 'package:flutter_home_assignment/presentation/multiprovider/multiprovider.dart';
import 'package:provider/provider.dart';
import 'presentation/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () async {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
        (_) {
          runApp(
            AssignmentApp(),
          );
        },
      );
    },
    (Object error, StackTrace stackTrace) async {
      /**
       * Log Error in firebase console
       */
      if (kDebugMode) {
        print(stackTrace);
      }
    },
  );
}

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomTimerBloc(
        customTimer: const CustomTimer(),
      ),
      child: MaterialApp(
        key: key,
        title: 'Assignment',
        onGenerateRoute: (settings) => AppRoutes.appRoutes(settings),
        initialRoute: AppRoutes.initializer,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
