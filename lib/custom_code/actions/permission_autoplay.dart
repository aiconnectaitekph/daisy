// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future permissionAutoplay() async {
  // on page load, request to grant the permission to autoplay audio from voice assistant

  // Request permission to autoplay audio from voice assistant
  bool granted = await AudioService.start(
    backgroundTask: true,
    androidResumeOnClick: true,
    androidNotificationChannelName: 'Audio Service',
    androidNotificationChannelDescription: 'Audio Service',
  );

  if (granted) {
    print('Permission granted to autoplay audio from voice assistant');
  } else {
    print('Permission denied to autoplay audio from voice assistant');
  }
}

mixin AudioService {
  static start(
      {required bool backgroundTask,
      required bool androidResumeOnClick,
      required String androidNotificationChannelName,
      required String androidNotificationChannelDescription}) {}
}
