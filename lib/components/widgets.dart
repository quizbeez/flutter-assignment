import 'package:flutter/material.dart';

import '../utils/imagePath.dart';

class OptionList extends StatelessWidget {
  String? options;
  VoidCallback? onTap;

  OptionList({Key? key, this.options, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xFF8244D3),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                options!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget brainImage() {
  return SizedBox(height: 250, width: 250, child: Image.asset(ImagePath.brain));
}

Widget question(String text,BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
    ),
  );
}
