// ignore_for_file: prefer_const_constructors, prefer_final_locals, unused_local_variable, strict_raw_type, lines_longer_than_80_chars

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/src/repository/home_page_network_loadable.dart';
import 'package:shared/shared.dart';

void main() async {
  // we need this because of the mocks
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  group('DataLoadBloc', () {
    late MockedHomePageNetworkLoadable repo;
    late List<ListItemUIModel> popular;

    setUp(() async {
      repo = MockedHomePageNetworkLoadable();
      final results = await repo.getPopular() as List<MoviePaginatedResults>;
      popular = results
          .map((e) => HomePageUIMapper().createFromMovieResults(e))
          .expand((element) => element)
          .toList();
    });

    test('mock works', () async {
      await repo.getPopular();
    });

    blocTest<DataLoadBloc, DataState>(
      'we can load data',
      build: () => DataLoadBloc(repo, HomePageUIMapper()),
      act: (bloc) => bloc.add(LoadAll()),
      expect: () => <DataState>[
        DataStateLoading(),
        DataStateFull(data: popular),
      ],
    );

    blocTest<DataLoadBloc, DataState>(
      'when data is wrong, we go to error state',
      build: () => DataLoadBloc(_FailedRepo(), HomePageUIMapper()),
      act: (bloc) => bloc.add(LoadAll()),
      expect: () => <DataState>[
        DataStateLoading(),
        errorState,
      ],
    );
  });
}

class _FailedRepo extends HomePageNetworkLoadable {
  @override
  Future getNowPlaying<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) {
    throw Exception('This should not work');
  }

  @override
  Future getPopular<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) {
    return Future.error(Error());
  }

  @override
  Future getTopRated<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) {
    throw Exception('This should not work');
  }
}
