import 'package:api_core/src/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpsClient extends Mock implements http.Client {}
class MockResponsesClient extends Mock implements http.Response {}
class FakeUriClient extends Fake implements Uri {}

/// THIS CLASS IS NOT GONNA OVERRIDE ALL THE IMPLEMENTATIONS
class MockApiClient extends Mock implements ApiClient {}
