import 'package:flutter/foundation.dart';

void printLog(String tag, Object object) {
  if (kDebugMode) {
    // String time = DateTime.now().toString();
    String message = '$tag ->  $object';
    // debugPrint('$time | $message');
    debugPrint(message);
  }
}

enum LogMode { debug, live }

class Logger {
  static LogMode _logMode = LogMode.debug;
  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      debugPrint("Error => $data$stackTrace");
    }
  }
}
