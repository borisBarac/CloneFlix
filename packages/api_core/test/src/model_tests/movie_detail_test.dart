// // ignore_for_file: prefer_const_constructors
import 'package:api_core/src/models/movie/movie.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures.dart';

void main() {
  const mockFile = 'movie_details.json';

  group('Movie', () {
    WidgetsFlutterBinding.ensureInitialized();
    test('details can be initialized', () {
      final json = jsonFromFixture(mockFile) as Map<String, dynamic>;
      final md = MovieDetail.fromJson(json);
      expect(md, isNotNull);
    });

    test('details can be initialized with mock files', () async {
      final md = await createMovieDetailsFromMock();
      expect(md, isNotNull);
    });

    test('PaginatedResults can be initialized with mock files', () async {
      final md = await createPaginatedMoviesFromMock();
      expect(md, isNotNull);
    });
  });
}
