import 'package:flutter/material.dart';
import '../../res/res.dart';
import '../../routes/app_routes.dart';
import '../../widgets/spacer.dart';
import 'widgets/get_progress_bar.dart';
import 'widgets/app_animation.dart';

class Initializer extends StatefulWidget {
  const Initializer({Key? key}) : super(key: key);

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => navigateToHomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: colors.appColor,
      body: SizedBox(
        width: sizes.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getAppAnimation(),
            verticalSpacer(26),
            getProgressBar(),
          ],
        ),
      ),
    );
  }

  void navigateToHomePage() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
    );
  }
}
