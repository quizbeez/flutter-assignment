import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/ui/model/QuestionModel.dart';
import 'package:flutter_home_assignment/utils/all_constants.dart';

class MainQuizScreen extends StatefulWidget {
  const MainQuizScreen({Key? key}) : super(key: key);

  @override
  State<MainQuizScreen> createState() => _MainQuizScreenState();
}

class _MainQuizScreenState extends State<MainQuizScreen> {
  late StreamController<QuestionModel> _userController;

  @override
  void initState() {
    _userController = new StreamController();
    Timer.periodic(Duration(seconds: 1), (_) => loadDetails());
    // loadDetails();
    super.initState();
  }

  loadDetails() async {
    // QuestionModel().getUserInfo('horlaz229@gmail.com', '123456').then((res) async{
    //   print('LoadDetails of ${res.fname}');
    //   _userController.add(res);
    //   return res;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customAppBar(),
          Center(
            child: Container(
              width: Dimens.hundred,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  CommonTextWidget(
                      text: AppStrings.question,
                      hasStroke: true,
                      fontSize: Dimens.eighteen,
                      fontWeight: FontWeight.w400,
                      strokeColor: Colors.black,
                      fontColor: Colors.white),
                  CommonTextWidget(
                      text: AppStrings.question,
                      hasStroke: false,
                      fontSize: Dimens.eighteen,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget customAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Row(
          children: [
            const Icon(
              Icons.ac_unit_outlined,
              color: Colors.orange,
            ),
            Container(
              margin: const EdgeInsets.only(right: Dimens.twenty),
              height: Dimens.twenty,
              width: Dimens.fifty,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: const BorderRadius.only(
                    topRight: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                    topLeft: const Radius.circular(0.0),
                    bottomLeft: const Radius.circular(0.0)),
              ),
              child: Center(
                child: CommonTextWidget(
                    text: "100",
                    hasStroke: false,
                    fontSize: Dimens.forteen,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _questions() {
    return Container(
      child: Text("Test"),
    );

    //...
  }
}
