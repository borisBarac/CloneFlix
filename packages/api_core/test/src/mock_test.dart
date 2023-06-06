import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'shared_mocks.dart';

void main() {
  late http.Client httpClient;

  setUpAll(() {
    registerFallbackValue(FakeUriClient());
  });

  setUp(() {
    httpClient = MockHttpsClient();
  });

  group('HTTP MOCKS', () {
    test('mocktail works', () {
      final response = MockResponsesClient();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn('{}');

      when(() => httpClient.get(any()))
          .thenAnswer((invocation) async => response);

      final res = httpClient.get(FakeUriClient());

      expect(res, completes);
      expect(res, isNotNull);

    });
  });
}