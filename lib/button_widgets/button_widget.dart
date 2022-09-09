import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerButtons extends StatefulWidget {
  final text;
  final VoidCallback? onTap;
  const AnswerButtons({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  State<AnswerButtons> createState() => _AnswerButtonsState();
}

class _AnswerButtonsState extends State<AnswerButtons> {
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle:  TextStyle(fontSize: 12.sp,color: Colors.deepPurpleAccent),primary: Colors.deepPurpleAccent);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: style,
      onPressed: widget.onTap,
      child:  Padding(
        padding:  EdgeInsets.all(3.r),
        child: Text(widget.text),
      ),
    );
  }
}
