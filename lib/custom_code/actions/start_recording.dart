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

Future startRecording() async {
  // on tap it must start recording audio input from microphone

  try {
    await Permission.microphone.request(); // Request microphone permission
    if (await Permission.microphone.isGranted) {
      // Start recording audio input from microphone
      await AudioRecorder.start();
    } else {
      // Handle case where microphone permission is not granted
      print('Microphone permission not granted');
    }
  } catch (e) {
    // Handle any errors that occur during recording
    print('Error starting recording: $e');
  }
}

class Permission {
  static var microphone;
}

class AudioRecorder {
  static start() {}
}
