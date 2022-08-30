import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final logger = Logger('App');

void setupLogger(Logger log) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    String emoji = '';
    if (record.level == Level.INFO) {
      emoji = 'ℹ️';
    } else if (record.level == Level.WARNING) {
      emoji = '❗️';
    } else if (record.level == Level.SEVERE) {
      emoji = '⛔️';
    }
    debugPrint('$emoji   ${record.level.name}: ${record.message}');
    if (record.error != null) {
      debugPrint('👉 ${record.error}');
    }
    if (record.level == Level.SEVERE) {
      debugPrintStack(stackTrace: record.stackTrace);
    }
  });
}

bool validateEmail(String phoneEmailCtr) {
  if (EmailValidator.validate(phoneEmailCtr)) return true;

  return false;
}

bool validatePhoneNumber(String phoneCtr) {
  String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(phonePattern);

  if (phoneCtr.length == 10 && regExp.hasMatch(phoneCtr)) return true;

  return false;
}
