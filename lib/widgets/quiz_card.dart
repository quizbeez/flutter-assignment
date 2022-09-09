import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/model/product.dart';
import 'package:flutter_home_assignment/style/color_constants.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';
import 'package:flutter_home_assignment/views/home/bloc/home_bloc.dart';
import 'package:flutter_home_assignment/widgets/rounded_button.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, this.product, this.ontap}) : super(key: key);

  final Product? product;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product!.question!,
                style: TextStyle(
                    // fontSize: 24,
                    fontSize: Dimensions.screenWidth * 0.06,
                    color: ColorConstants.gray75,
                    fontWeight: FontWeight.bold),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return RoundedButton(
                buttonName: product!.options[1],
                onTap: ontap,
                color: ColorConstants.appColor,
                textColor: ColorConstants.white,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return RoundedButton(
                buttonName: product!.options[0],
                onTap: ontap,
                color: ColorConstants.appColor,
                textColor: ColorConstants.white,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return RoundedButton(
                buttonName: product!.options[3],
                onTap: ontap,
                color: ColorConstants.appColor,
                textColor: ColorConstants.white,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return RoundedButton(
                buttonName: product!.options[2],
                onTap: ontap,
                color: ColorConstants.appColor,
                textColor: ColorConstants.white,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildError(String message) {
    return Center(
      child: Text(message),
    );
  }
}
