import 'dart:async';

import 'package:api_core/api_core.dart';

/// Defines the list of calls we need to be able to do for the home page
/// we have the same calls for both Movies and TV shows,
///  even the APIs are almost the same
abstract class DetailPageNetworkLoadable {
  /// nodoc
  Future<MovieDetail> getMovieDetails(int id);

  /// nodoc
  Future<ShowDetail> getTvShowDetails(int id);

  /// nodoc
  Future<List<MoviePaginatedResults>> getSimilarMovies(int id);

  /// nodoc
  Future<TvSeason> getSeasonForShow(int id, {int seasonNumber = 0});
}

/// nodoc
class MockedDetailPageNetworkLoadable implements DetailPageNetworkLoadable {
  @override
  Future<MovieDetail> getMovieDetails(int id) =>
      createMovieDetailsFromMock(packagePrefix: 'packages/api_core');

  @override
  Future<TvSeason> getSeasonForShow(int id, {int seasonNumber = 0}) =>
      createTVSeasonFromMock(packagePrefix: 'packages/api_core');

  @override
  Future<List<MoviePaginatedResults>> getSimilarMovies(int id) => Future.wait([
        createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
        createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
        createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
        createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      ]);

  @override
  Future<ShowDetail> getTvShowDetails(int id) => createShowDetailsFromMock();
}
