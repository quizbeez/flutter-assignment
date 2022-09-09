import 'dart:developer' as dev;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/color_constants.dart';
import '../style/dimensions.dart';
import 'app_constants.dart';

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}

class Utility {
  static bool isShowing = false;

  static bool isEmpty(String? string) {
    return string == null || string.isEmpty;
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Widget? hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return null;
  }

  static Future<String> getUserAPIKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAPIKey = prefs.getString(AppConstants.apiKey);
    return userAPIKey!;
  }

  static snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget buildProgressIndicator() {
    return Container(
      height: Dimensions.screenHeight,
      color: ColorConstants.black.withOpacity(0.4),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorConstants.blue,
          valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.white),
        ),
      ),
    );
  }

  static void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }
}
