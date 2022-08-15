
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/presentation/screens/home/home.dart';

import '../screens/initializer/initializer.dart';

class AppRoutes {
  static const initializer = '/';
  static const home = '/home';

  static Route<dynamic> appRoutes(RouteSettings? settings) {
    switch (settings!.name!) {
      case initializer:
        return MaterialPageRoute(
          builder: (context) => const Initializer(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Container(),
    );
  }
}
