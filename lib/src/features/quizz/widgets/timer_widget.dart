import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.seconds,
  }) : super(key: key);

  final double seconds;

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 0.0,
      maximum: 10,
      orientation: LinearGaugeOrientation.horizontal,
      majorTickStyle: const LinearTickStyle(length: 20),
      showLabels: false,
      showTicks: false,
      animationDuration: 0,
      animateRange: true,
      isMirrored: true,
      barPointers: [
        LinearBarPointer(
          value: seconds,
          animationDuration: 0,
          color: Colors.green[200],
          position: LinearElementPosition.cross,
        )
      ],
      axisTrackStyle: LinearAxisTrackStyle(
          color: Colors.grey[350],
          edgeStyle: LinearEdgeStyle.bothFlat,
          thickness: 5.0,
          borderColor: Colors.grey),
    );
  }
}
