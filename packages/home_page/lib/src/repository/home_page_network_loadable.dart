// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';

/// Defines the list of calls we need to be able to do for the home page
/// we have the same calls for both Movies and TV shows,
///  even the APIs are almost the same
abstract class HomePageNetworkLoadable {
  Future<dynamic> getPopular<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]);
  Future<dynamic> getNowPlaying<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]);
  Future<dynamic> getTopRated<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]);
}

/// easy to use mock file for previews and unit tests
class MockedHomePageNetworkLoadable extends HomePageNetworkLoadable {
  @override
  Future<dynamic> getNowPlaying<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) async {
    throw Exception('not implemented yet');
  }

  @override
  Future<dynamic> getPopular<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) async {
    return createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core')
        .then((value) => [value]);
  }

  @override
  Future<dynamic> getTopRated<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) async {
    throw Exception('not implemented yet');
  }
}
