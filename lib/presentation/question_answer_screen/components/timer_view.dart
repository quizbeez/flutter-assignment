import 'package:flutter_home_assignment/config/all_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TimerView extends StatelessWidget {
  final double seconds;

  const TimerView({Key? key, required this.seconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfLinearGauge(
        showLabels: false,
        showTicks: false,
        animationDuration: 0,
        animateRange: true,
        isMirrored: true,
        orientation: LinearGaugeOrientation.horizontal,
        majorTickStyle: const LinearTickStyle(length: 20),
        barPointers: const [
          LinearBarPointer(value: 5, animationDuration: 0, color: colorGreen, position: LinearElementPosition.cross)
        ],
        minimum: 0.0,
        maximum: 15,
        axisTrackStyle: LinearAxisTrackStyle(
            color: colorGrey300, edgeStyle: LinearEdgeStyle.bothFlat, thickness: 5.0, borderColor: colorGrey),
      ),
    );
  }
}
