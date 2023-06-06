// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';
import 'package:detail_page/src/data/detail_page_network_loadable.dart';
import 'package:detail_page/src/detail_page_exceptions.dart';
import 'package:shared/shared_data_layer.dart';

/// same for both TVs and Movies
/// Only the class model we gonna inject in the mapper is not gonna be the same
class DetailPageRepository extends AppRepository
    implements DetailPageNetworkLoadable {
  DetailPageRepository(super.config, super.apiCore);
  DetailPageRepository.initWithGetIt() : super.initWithGetIt();

  @override
  Future<MovieDetail> getMovieDetails(int id) async {
    final url = DetailsRoute(domain, subDomain, apiVersion, RouteType.movie, id)
        .getUrl();
    if (url == null) throw ArgumentError('Could not make url');

    return apiCore.getModel(url, JsonModelType.movieDetail);
  }

  @override
  Future<ShowDetail> getTvShowDetails(int id) async {
    final url =
        DetailsRoute(domain, subDomain, apiVersion, RouteType.tv, id).getUrl();
    if (url == null) throw ArgumentError('Could not make url');

    return apiCore.getModel(url, JsonModelType.showDetail);
  }

  @override
  Future<TvSeason> getSeasonForShow(int id, {int seasonNumber = 0}) {
    final url = TvSeasonDetailsRoute(
      domain,
      subDomain,
      apiVersion,
      id,
      seasonNumber,
    ).getUrl();
    if (url == null) throw ArgumentError('Could not make url');

    return apiCore.getModel(url, JsonModelType.tvSeason);
  }

  @override
  Future<List<MoviePaginatedResults>> getSimilarMovies(int id) async {
    final urls = List.generate(10, (index) => index + 1)
        .map(
          (page) => GetSimilarRoute(
            domain,
            subDomain,
            apiVersion,
            RouteType.movie,
            id,
            page,
          ).getUrl(),
        )
        .where((element) => element != null);

    try {
      final data = await Future.wait(
        urls.map(
          (url) => apiCore.getModel<MoviePaginatedResults>(
            url!,
            JsonModelType.moviePaginatedResults,
          ),
        ),
      );
      data.sort((a, b) => a.page.compareTo(b.page));
      return Future.value(data);
    } catch (e) {
      log(e.toString());
      throw DetailPageException.couldNotMakeDetails;
    }
  }
}
