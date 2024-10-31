import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EmilioAiAPICall {
  static Future<ApiCallResponse> call({
    String? apiToken = '',
    String? content = '',
    String? oldContent = '',
    String? model = 'meta-llama/Llama-Vision-Free',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "$model",
  "messages": [
    {
      "role": "assistant",
      "content": "$oldContent"
    },
    {
      "role": "user",
      "content": "$content"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emilioAiAPI',
      apiUrl: 'https://api.together.xyz/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ef59ffaa887ba258b4945004a613beb671bf6bf4a3e3a18e2966e3064694581a',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? prompt(dynamic response) => getJsonField(
        response,
        r'''$.prompt''',
        true,
      ) as List?;
}

class TtsCall {
  static Future<ApiCallResponse> call({
    String? voiceId = 'joe-biden',
    String? model = 'ar-diff-50k',
    String? text = 'Hello tell me a secret',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$text",
  "voice_id": "$voiceId",
  "params": {
    "model": "$model"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TTS',
      apiUrl: 'https://api.neets.ai/v1/tts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer c0d9aeeef6f14e98ad46c8d23e24535b',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
