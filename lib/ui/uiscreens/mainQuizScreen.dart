import 'package:flutter/material.dart';

import 'package:flutter_home_assignment/utils/all_constants.dart';

class MainQuizScreen extends StatefulWidget {
  const MainQuizScreen({Key? key}) : super(key: key);

  @override
  State<MainQuizScreen> createState() => _MainQuizScreenState();
}

class _MainQuizScreenState extends State<MainQuizScreen> {
  List<QuestionModel> questions12 = [];
  int question_index = 0;

  final notificationsController = BehaviorSubject<List<QuestionModel>>();
  Stream<List<QuestionModel>> get getNotifications_Stream =>
      notificationsController.stream;
  StreamSink get getNotifications_Sink => notificationsController.sink;

  @override
  void initState() {
    questions12 = [];
    loadDetails();
    // loadDetails();
    super.initState();
  }

  loadDetails() async {
    List<QuestionModel> questionsdummy = [];
    questions12 = [];
    question_index = 0;
    for (int i = 0; i < kQuestions.length; i++) {
      questionsdummy.add(QuestionModel.fromJson(kQuestions[i]));
    }
    getNotifications_Sink.add(questionsdummy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            customAppBar(),
            Center(
              child: Container(
                width: Dimens.hundred,
                height: Dimens.thirty,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: <Widget>[
                    CommonTextWidget(
                        text: AppStrings.question +
                            " " +
                            question_index.toString(),
                        hasStroke: true,
                        fontSize: Dimens.eighteen,
                        fontWeight: FontWeight.w400,
                        strokeColor: Colors.black,
                        fontColor: Colors.white),
                    CommonTextWidget(
                        text: AppStrings.question +
                            " " +
                            question_index.toString(),
                        hasStroke: false,
                        fontSize: Dimens.eighteen,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white),
                  ],
                ),
              ),
            ),
            _questions()
          ],
        ),
      ),
    ));
  }

  Widget _questions() {
    return StreamBuilder<List<QuestionModel>>(
        stream: getNotifications_Stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //loadDetails();
          } else {
            questions12 = snapshot.data!;
            log("Length is ${questions12.length}");
          }
          return questions12.length > 0
              ? Column(
                  children: [
                    Image.asset(AppImages.icon_appimage,
                        height: Dimens.oneseventy,
                        width: Dimens.oneseventy,
                        fit: BoxFit.fill),
                    _showMainData()
                  ],
                )
              : SizedBox();
        });
  }

  Widget _showMainData() {
    log("Index in mainData is  ${question_index}");
    return Column(
      children: [
        CommonTextWidget(
            text: questions12[question_index].text!,
            hasStroke: false,
            fontSize: Dimens.eighteen,
            textAlignment: TextAlign.center,
            fontWeight: FontWeight.w700,
            fontColor: Colors.black),
        _options(
            incorrect: questions12[question_index].incorrect!,
            correct: questions12[question_index].correct!)
      ],
    );
  }

  Widget _options({required List<String> incorrect, required String correct}) {
    List<String> options = [];
    for (int i = 0; i < incorrect.length; i++) {
      options.add(incorrect[i]);
    }
    options.shuffle();
    options.add(correct);

    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            log("Index value is $index");
            log("question_index value is $question_index");

            if (question_index < questions12.length - 1) {
              if (options[index] == correct) {
                AppStrings.points = AppStrings.points + 10;
              }
              setState(() {
                question_index = question_index + 1;
                log("Index value is $question_index");
              });
            } else {
              if (options[index] == correct) {
                AppStrings.points = AppStrings.points + 10;
              }
              AppStrings.points = 0;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.all(Dimens.twenty),
            margin: EdgeInsets.all(Dimens.ten),
            child: CommonTextWidget(
                text: options[index],
                hasStroke: false,
                textAlignment: TextAlign.center,
                fontSize: Dimens.forteen,
                fontWeight: FontWeight.w600,
                fontColor: Colors.white),
          ),
        );
      },
    );
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
                    text: AppStrings.points.toString(),
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

//...
}
