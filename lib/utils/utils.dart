import 'package:flutter/material.dart';

const bool _isPrintLog = true;

void printLog(String strLogMessage) {
  if (_isPrintLog) {
    debugPrint("----------LOG----------");
    debugPrint("-> $strLogMessage <-");
  }
}