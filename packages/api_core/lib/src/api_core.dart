import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:api_core/src/api_client.dart';
import 'package:api_core/src/api_exception.dart';
import 'package:api_core/src/models/json_model_type.dart';
import 'package:http/http.dart' as http;

/// JSON mapping type def
typedef JsonMapping = Map<String, Object?>;

/// Designed to be used in the main app
class ApiCore {
  /// This is gonna be used like a main entry point for making requests.
  /// Main use case of this call is gonna be repository classes in vertical packages.
  ///
  /// [token] A block that needs to provide valid API token used to identify the app
  ///
  /// [mockedApiClient] used for test mocking
  ApiCore.from(
    TokenBlock token, [
    http.BaseClient? mockedApiClient,
  ]) {
    _client = mockedApiClient ?? ApiClient(token, http.Client());
  }

  late final http.BaseClient _client;

  /// Get the json object from URI
  Future<JsonMapping> getJson(Uri uri) {
    return _client.get(uri).then(
          (response) => jsonDecode(response.body) as Map<String, Object?>,
        );
  }

  /// Gets the json from specific URI and converts it to specific model
  /// If we have and exception, it is gonna get passed in the future
  Future<T> getModel<T extends JsonSerializableModel>(
    Uri uri,
    JsonModelType type,
  ) {
    return _client
        .get(uri)
        // ignore: body_might_complete_normally_catch_error
        .catchError((Object? error, StackTrace stackTrace) {
      log('ApiCore Error:, $error, $stackTrace');
    }).then(
      (response) {
        if (399 < response.statusCode && response.statusCode < 500) {
          throw ApiException.dataError;
        } else if (response.statusCode > 499) {
          throw ApiException.serverError;
        }

        return jsonDecode(response.body) as Map<String, Object?>;
      },
    ).then(
      (value) => JsonSerializableModel.fromJson(type, value) as T,
    );
  }
}
