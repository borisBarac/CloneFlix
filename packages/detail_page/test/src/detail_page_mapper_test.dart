// // ignore_for_file: prefer_const_constructors
import 'package:api_core/api_core.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/mappers/detail_page_mapper.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('DetailPageUIMapper', () {
    test('can make UI model from mocked Movie data', () async {
      final mapper = DetailPageUIMapper();

      final mixedApiResults = await Future.wait([
        createMovieDetailsFromMock(packagePrefix: 'packages/api_core'),
        Future.wait([
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
        ]),
      ]);
      final result = mapper.createFrom(
        mixedApiResults[0],
        mixedApiResults[1] as List,
        DetailsType.movie,
      );

      _checkResult(result);
    });

    test('can make UI model from mocked TV Show data', () async {
      final mapper = DetailPageUIMapper();

      final mixedApiResults = await Future.wait([
        createShowDetailsFromMock(packagePrefix: 'packages/api_core'),
        Future.wait([
          createTVSeasonFromMock(packagePrefix: 'packages/api_core'),
          createTVSeasonFromMock(packagePrefix: 'packages/api_core'),
        ]),
      ]);
      final result = mapper.createFrom(
        mixedApiResults[0],
        mixedApiResults[1] as List,
        DetailsType.tv,
      );

      _checkResult(result);
    });
  });
}

void _checkResult(DetailPageModel result) {
  expect(result.title, isNotEmpty);
  expect(result.posterUrl, isNotEmpty);
  expect(result.description, isNotEmpty);
  expect(result.detailsRowModels.length, equals(2));

  final firstCellOfFirstRow = result.detailsRowModels.first.first;
  expect(firstCellOfFirstRow.posterUrl, isNotEmpty);
  expect(firstCellOfFirstRow.title, isNotEmpty);
}
