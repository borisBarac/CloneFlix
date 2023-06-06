// ignore_for_file: prefer_const_constructors
import 'package:api_core/src/api_client.dart' as client;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  String token() => 'FAKE_TOKEN';
  late MockClient mockHttp;

  setUpAll(() {
    mockHttp = MockClient(
      (request) {
        final headers = request.headers;
        headers['content-type'] = 'application/json';

        final response = http.Response(
          '{}',
          200,
          request: request,
          headers: headers,
        );
        return Future.value(response);
      },
    );
  });

  group('ApiClient', () {
    test('can inject the token in the header', () async {
      final res = await client.ApiClient(token, mockHttp)
          .get(Uri.http('example.com', '/foo'));

      expect(res, isNotNull);
      expect(res.request, isNotNull);
      final testToken = token();
      final reqToken =
          res.request!.url.queryParametersAll[client.tokenKey]?.first;
      expect(reqToken, equals(testToken));
    });
  });
}
