// // ignore_for_file: prefer_const_constructors
import 'package:api_core/src/models/tv_show/tv_show.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Show', () {
    WidgetsFlutterBinding.ensureInitialized();

    test('Details can be initialized', () async {
      final res = await createShowDetailsFromMock();
      expect(res, isNotNull);
    });

    test('Seasons can be initialized', () async {
      final res = await createTVSeasonFromMock();
      expect(res, isNotNull);
    });

    test('Paginated ReSults can be initialized', () async {
      final res = await createTVPaginatedResultsFromMock();
      expect(res, isNotNull);
    });
  });
}
