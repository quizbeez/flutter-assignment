import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/style/color_constants.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';
import 'package:flutter_home_assignment/utils/image_paths.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashView());
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/home"));
    return Scaffold(
      body: Container(
        color: ColorConstants.white,
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Dimensions.screenHeight / 8,
                backgroundImage: const AssetImage(
                  ImagePath.splashLogo,
                ),
              ),
              SizedBox(
                height: Dimensions.screenWidth / 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                  "Quiz",
                  style: TextStyle(
                      fontSize: Dimensions.fontSize32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
