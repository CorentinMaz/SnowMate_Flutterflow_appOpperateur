import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Google Group Code

class GoogleGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://api-prediction-trajets-239066443369.northamerica-northeast1.run.app/v0';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static GetPredictTimeNextLocationsCall getPredictTimeNextLocationsCall =
      GetPredictTimeNextLocationsCall();
}

class GetPredictTimeNextLocationsCall {
  Future<ApiCallResponse> call({
    dynamic? locationsJson,
    String? authToken = '',
  }) async {
    final baseUrl = GoogleGroup.getBaseUrl(
      authToken: authToken,
    );

    final locations = _serializeJson(locationsJson, true);
    final ffApiRequestBody = '''
{
  "locations": ${locations}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get predict time next locations',
      apiUrl: '${baseUrl}/predict-time-next-locations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
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

/// End Google Group Code

class FirstConnectionCall {
  static Future<ApiCallResponse> call({
    String? operatorsEmail = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'First connection',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:RB_3CkS2/operators/${operatorsEmail}/firstConnection',
      callType: ApiCallType.PUT,
      headers: {},
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

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:RB_3CkS2/auth/login',
      callType: ApiCallType.POST,
      headers: {},
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

class GetOperateurConnectCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get operateur connect',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:RB_3CkS2/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSnowOperationsWithParcoursIdCall {
  static Future<ApiCallResponse> call({
    String? parcoursId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get snowOperations with parcoursId',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:pH0vXb1d/parcours/${parcoursId}/snowOperations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmSnowOperationWithParcoursIdCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? parcoursId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Confirm snowOperation with parcoursId',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:pH0vXb1d/parcours/${parcoursId}/snowOperation/Confirmed',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
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

class StartSnowOperationWithParcoursIdCall {
  static Future<ApiCallResponse> call({
    String? parcoursId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Start snowOperation with parcoursId',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:pH0vXb1d/parcours/${parcoursId}/snowOperation/start',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
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

class AddSnowOperationHistoryCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? snowoperationsId,
    List<int>? currentDateList,
    dynamic? currentLocationJson,
  }) async {
    final currentDate = _serializeList(currentDateList);
    final currentLocation = _serializeJson(currentLocationJson, true);
    final ffApiRequestBody = '''
{
  "snowoperations_id": ${snowoperationsId},
  "currentDate": ${currentDate},
  "currentLocation": ${currentLocation}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add snowOperation history',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:AolqAKOY/snowoperations_history',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
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

class ModifSnowOperationWhenOperatorWithinAddressCall {
  static Future<ApiCallResponse> call({
    int? snowoperationsId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Modif snowOperation when operator within address',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:pH0vXb1d/snowOperation/${snowoperationsId}/parcours/withinZone',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
