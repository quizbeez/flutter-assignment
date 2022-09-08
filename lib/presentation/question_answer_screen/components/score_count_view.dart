import 'package:flutter_home_assignment/config/text_styles.dart';
import 'package:flutter/material.dart';

class ScoreCountView extends StatelessWidget {
  const ScoreCountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 30,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
            ),
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            child: Text("100", style: textStyleBlack5418Bold),
          ),
          Transform.translate(
            offset: const Offset(-37, 0),
            child: Container(
              height: 25,
              width: 45,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.circle_rounded, color: Colors.yellow[700], size: 45),
            ),
          ),
        ],
      ),
    );
  }
}
