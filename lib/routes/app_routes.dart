import 'package:flutter_home_assignment/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/views/home/home_view.dart';
import 'package:flutter_home_assignment/views/splash/splash_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    printf("This is route: ${settings.name} ");

    switch (settings.name) {
      case '/':
        return HomeView.route();
      case HomeView.routeName:
        return HomeView.route();
      case SplashView.routeName:
        return SplashView.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
                appBar: AppBar(
              title: const Text("Error"),
            )));
  }
}
