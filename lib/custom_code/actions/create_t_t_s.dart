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

import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON encoding and decoding

Future createTTS() async {
  // create a text to speech using neets.ai API

  // API endpoint for neets.ai text to speech
  String url = 'https://api.neets.ai/tts/v1/synthesize';

  // API key for neets.ai
  String apiKey = 'c0d9aeeef6f14e98ad46c8d23e24535b';

  // Text to be converted to speech
  String text = 'Hello, how are you?';

  // HTTP headers
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  // HTTP request body
  Map<String, dynamic> body = {
    'text': text,
    'voice': 'en-US-Wavenet-A',
    'format': 'mp3',
  };

  // Make HTTP POST request to neets.ai API
  http.Response response = await http.post(
    Uri.parse(url), // Use Uri.parse for the URL
    headers: headers,
    body: json.encode(body),
  );

  // Check if request was successful
  if (response.statusCode == 200) {
    // Get the audio file from the response
    // Save the audio file to local storage or play it directly
    // For example, you can use audioplayers package to play the audio
    // audioplayers.playBytes(audioFile);

    print('Text to speech created successfully');
  } else {
    print('Failed to create text to speech');
  }
}
