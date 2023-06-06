// ignore_for_file: lines_longer_than_80_chars

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Block type used to inject the token in the package
typedef TokenBlock = String Function();

/// Client we are using to make requests
/// This client is gonna inject the common attributes we need (like custom headers).
///
/// [http.BaseClient] is the super class
@visibleForTesting
class ApiClient extends http.BaseClient {
  /// Main constructor
  ///
  /// [_token] is a block that gives back the API token to ID the app,
  /// [_delegate] is the actual client that does the request
  ApiClient(this._token, this._delegate);

  final TokenBlock _token;
  final http.Client _delegate;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final params = {
      ...request.url.queryParameters,
      tokenKey: _token(),
    };

    return _delegate.send(
      http.Request(
        request.method,
        request.url.replace(queryParameters: params),
      )..headers.addAll(request.headers),
    );
  }
}

/// nodoc

@visibleForTesting
const tokenKey = 'api_key';
