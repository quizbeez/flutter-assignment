import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/routes/app_routes.dart';
import 'package:flutter_home_assignment/style/color_constants.dart';
import 'package:flutter_home_assignment/utils/app_constants.dart';
import 'package:flutter_home_assignment/views/home/home_view.dart';
import 'package:flutter_home_assignment/views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica Neue",
        primarySwatch: ColorConstants.appColor,
      ),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            data: data.copyWith(textScaleFactor: 1), child: child!);
      },
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashView.routeName,
      title: AppConstants.appName,
      home: HomeView(),
    );
  }
}
