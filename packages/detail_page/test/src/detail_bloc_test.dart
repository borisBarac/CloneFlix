// ignore_for_file: unused_local_variable

import 'package:api_core/api_core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/mappers/detail_page_mapper.dart';
import 'package:detail_page/src/data/detail_page_network_loadable.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() async {
  // we need this because of mocks
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  group('DataLoadBloc', () {
    late DetailPageNetworkLoadable repo;
    late List<ListItemUIModel> popular;
    final mapper = DetailPageUIMapper();
    late List<dynamic> mixedApiResults;
    late DetailPageModel model;
    setUp(() async {
      repo = MockedDetailPageNetworkLoadable();
      mixedApiResults = await Future.wait([
        createMovieDetailsFromMock(packagePrefix: 'packages/api_core'),
        Future.wait([
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
          createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
        ]),
      ]);
      model = mapper.createFrom(
        mixedApiResults[0],
        mixedApiResults[1] as List,
        DetailsType.movie,
      );
    });

    test('mock works', () async {
      await repo.getMovieDetails(111);
    });

    blocTest<DetailBloc, DetailState>(
      'we can load data',
      build: () => DetailBloc(repo, DetailPageUIMapper()),
      act: (bloc) => bloc.add(LoadDetails(11, DetailsType.movie)),
      expect: () => <DetailState>[
        DetailStateLoading(),
        DetailStateFull(model),
      ],
    );

    blocTest<DetailBloc, DetailState>(
      'when data is wrong, we go to error state',
      build: () => DetailBloc(_FailedRepo(), DetailPageUIMapper()),
      act: (bloc) => bloc.add(LoadDetails(1, DetailsType.movie)),
      expect: () => <DetailState>[
        DetailStateLoading(),
        const DetailStateEmpty(
          id: 1,
          type: DetailsType.movie,
          message: 'We could not get data',
        ),
      ],
    );
  });
}

class _FailedRepo extends DetailPageNetworkLoadable {
  @override
  Future<MovieDetail> getMovieDetails(int id) {
    throw UnimplementedError();
  }

  @override
  Future<TvSeason> getSeasonForShow(int id, {int seasonNumber = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<List<MoviePaginatedResults>> getSimilarMovies(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ShowDetail> getTvShowDetails(int id) {
    throw UnimplementedError();
  }
}
