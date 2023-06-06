// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';
import 'package:home_page/src/repository/home_page_network_loadable.dart';
import 'package:home_page/src/repository/home_rep_exception.dart';
import 'package:shared/shared_data_layer.dart';

/// same for both TVs and Movies
/// Only the class model we gonna inject in the mapper is not gonna be the same
class HomeRepository extends AppRepository implements HomePageNetworkLoadable {
  HomeRepository(super.config, super.apiCore);
  HomeRepository.initWithGetIt() : super.initWithGetIt();

  @override
  Future<List<Model>> getPopular<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) async {
    final urls = List.generate(10, (index) => index + 1)
        .map(
          (page) => GetPopularRoute(
            domain,
            subDomain,
            apiVersion,
            type,
            page,
          ).getUrl(),
        )
        .where((element) => element != null);

    try {
      final data = await Future.wait(
        urls.map(
          (url) => apiCore.getModel<Model>(
            url!,
            type == RouteType.movie
                ? JsonModelType.moviePaginatedResults
                : JsonModelType.tvPaginatedResults,
          ),
        ),
      );
      data.sort((a, b) => a.page.compareTo(b.page));
      return Future.value(data);
    } catch (e) {
      log(e.toString());
      throw HomePageException.couldNotGetData;
    }
  }

  /// to come
  @override
  Future<Model> getNowPlaying<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) {
    // TODO: implement getNowPlaying
    throw UnimplementedError();
  }

  /// to come
  @override
  Future<Model> getTopRated<Model extends PaginatedJsonSerializableModel>([
    RouteType type = RouteType.movie,
  ]) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }
}
