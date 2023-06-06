import 'package:api_core/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const domain = 'themoviedb.org';
  const subDomain = 'api';
  const apiVersion = '3';

  group('Routes', () {
    test('can build a MovieDetail route', () {
      final expected = Uri.parse('https://api.themoviedb.org/3/movie/76600');
      final routeUrl =
          DetailsRoute(domain, subDomain, apiVersion, RouteType.movie, 76600)
              .getUrl();

      expect(routeUrl, equals(expected));
    });

    test('can build a popular TV route', () {
      final expected =
          Uri.parse('https://api.themoviedb.org/3/tv/popular?page=2');
      final routeUrl =
          GetPopularRoute(domain, subDomain, apiVersion, RouteType.tv, 2)
              .getUrl();

      expect(routeUrl, equals(expected));
    });

    test('can build a TV Season route', () {
      /// GET /tv/{tv_id}/season/{season_number}
      final expected =
          Uri.parse('https://api.themoviedb.org/3/tv/123/season/2');
      final routeUrl =
          TvSeasonDetailsRoute(domain, subDomain, apiVersion, 123, 2).getUrl();

      expect(routeUrl, equals(expected));
    });

    test('can build a Similar Movies route', () {
      /// GET /tv/{tv_id}/season/{season_number}
      final expected =
          Uri.parse('https://api.themoviedb.org/3/movie/76600/similar?page=1');
      final routeUrl = GetSimilarRoute(
        domain,
        subDomain,
        apiVersion,
        RouteType.movie,
        76600,
        1,
      ).getUrl();

      expect(routeUrl, equals(expected));
    });

    test('can build a Image route', () {
      final expected = Uri.parse(
        'https://image.tmdb.org/t/p/w92/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
      );
      final routeUrl = const ImageRoute(
        's16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
        ImageRouteType.poster,
        ImageRouteQuality.S,
      ).getUrl(); //w92

      expect(routeUrl, equals(expected));
    });
  });
}
