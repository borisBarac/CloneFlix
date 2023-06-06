// // ignore_for_file: prefer_const_constructors
import 'package:api_core/api_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';
import 'shared_mocks.dart';

void main() {
  String fakeToken() => 'FAKE_TOKEN';
  const fixtureFile = 'movie_details.json';

  group('ApiCore', () {
    late ApiCore core;
    late MockApiClient mockHttpsClient;

    setUpAll(() {
      registerFallbackValue(FakeUriClient());
      mockHttpsClient = MockApiClient();
    });

    setUp(() {
      core = ApiCore.from(fakeToken, mockHttpsClient);
    });

    final okResponse = MockResponsesClient();
    when(() => okResponse.statusCode).thenReturn(200);
    when(() => okResponse.body).thenReturn(fixtureFileAsString(fixtureFile));
    void mockOKResponse() {
      when(() => mockHttpsClient.get(any()))
          .thenAnswer((invocation) async => okResponse);
    }

    test('can be initialized', () {
      expect(core, isNotNull);
    });

    test('can get json', () async {
      mockOKResponse();
      final val = await core.getJson(FakeUriClient());

      expect(val, isNotNull);
      expect(val, isInstanceOf<JsonMapping>(), reason: 'type check fail');
    });

    test('can get model', () async {
      mockOKResponse();
      final val =
          await core.getModel(FakeUriClient(), JsonModelType.movieDetail);

      expect(val, isNotNull);
      expect(val, isInstanceOf<MovieDetail>(), reason: 'type check fail');
    });
  });
}
