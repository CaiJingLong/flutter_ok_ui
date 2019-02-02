import 'dart:async';

import 'package:logging/logging.dart';

class OKLog {
  String tag;
  Level level;

  Logger logger;

  OKLog({this.tag = "", this.level = Level.INFO}) {
    logger = Logger("OKLog");
    logger.isLoggable(this.level);
  }

  void log(dynamic msg, {Level level, Object error, StackTrace stackTrace, Zone zone}) {
    level ??= this.level;
    String message;

    if (msg is String) {
      message = msg;
    } else {
      message = msg?.toString() ?? "null";
    }

    String tag;

    if (this.tag != null && this.tag.isNotEmpty) {
      tag = "${this.tag}:";
    } else {
      tag = "";
    }

    message = "$tag:$message";

    logger.log(level, message, error, stackTrace, zone);
  }
}
