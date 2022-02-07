import 'dart:async';

import 'package:at_utils/at_logger.dart';
import 'package:atsign_location_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  AtSignLogger.root_level = 'finer';
  WidgetsFlutterBinding.ensureInitialized();
  runZoned<Future<void>>(() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((_) {
      runApp(const MyApp());
    });
  });
}
