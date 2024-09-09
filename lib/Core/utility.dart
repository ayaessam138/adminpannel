import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Utility {
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
  static bool get isWeb => kIsWeb;

  static dynamic getValue(String type, dynamic value) {
    if (value == null) {
      if (type == "int") {
        return value = 0;
      } else if (type == "String") {
        return value = "-";
      } else if (type == "double") {
        return value = 0.0;
      }
    } else {
      return value;
    }
  }
  static myPrintX(object) async {
    if (!kReleaseMode) print(object);
  }

}