import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'CubitClass.dart';

class quizbeez extends StatefulWidget {
  const quizbeez({Key? key}) : super(key: key);

  @override
  State<quizbeez> createState() => _quizbeezState();
}

class _quizbeezState extends State<quizbeez> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    controller.repeat(reverse: true);
    // print(res.toJson().length);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context, listen: false);
    bloc.updateQuestion();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20.r,
                  15.r,
                  20.r,
                  8.r,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.clear,
                      size: 30.r,
                    ),
                    Spacer(),
                    Image.asset("assets/images.png", width: 30.w),
                    Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.circular(20.0.r),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.circular(20.0.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "100",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17.sp,
                              color: Colors.blueGrey.shade900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0.r),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.green.shade200,
                  color: Colors.green,
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              Image.asset("assets/human-brain-removebg-preview.png",
                  width: 50.sw),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  width: 1 * 0.70.sw,
                  child: Text(
                    bloc.res?.text ?? "",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueGrey.shade700),
                  )),
              SizedBox(height: 30.h),
              Column(
                children: bloc.incorrectButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
