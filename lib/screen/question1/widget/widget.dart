import 'package:flutter/material.dart';

Widget ansBox(BuildContext context, String text, bool isSelected) {
  return InkWell(
    child: Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected == true ? Colors.black : const Color(0xFFA020F0),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
