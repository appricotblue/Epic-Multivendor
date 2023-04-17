import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  ),
);

showInfoMessage(dynamic message){
  if(kDebugMode)logger.i(message);
}

showWarningMessage(dynamic message){
  if(kDebugMode)logger.w(message);
}

showErrorMessage(dynamic message){
  if(kDebugMode)logger.e(message);
}

showTerribleErrorMessage(dynamic message){
  if(kDebugMode)logger.wtf(message);
}

SnackBarMessage(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(milliseconds: 3000),
    backgroundColor: Colors.black.withOpacity(.3),
    elevation: 17,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    ),
  ));
}