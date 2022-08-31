import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final VoidCallback? onExpired;

  const TimerWidget({
    Key? key,
    required this.onExpired,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimerState(onExpired);
}

const timerDurationMillis = 5000;
const timerTickMillis = 10;

class TimerState extends State {
  final VoidCallback? onExpired;
  late Timer _timer;

  TimerState(this.onExpired);

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: timerTickMillis), (timer) {
      if (timer.tick > timerDurationMillis) {
        timer.cancel();
        onExpired!();
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: _timer.tick / timerDurationMillis);
  }
}
