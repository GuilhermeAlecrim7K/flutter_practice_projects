import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/src/quiz_app.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle
        .loadString('google_fonts/roboto_condensed/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const QuizApp());
}
