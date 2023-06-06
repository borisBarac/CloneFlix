part of routes;

// Do not handle errors that are not navigation specific with router,
// mainly we would need to predetermine all recovery actions,
// and inject them in to the route, at the point of making the route
// Navigation errors and redirects are handled in the setup of GoRouter

/// App screens we actually want to navigate to
enum AppRoute { home, movies, tvShows, detail, video }

class AppRouteBuilder {
  AppRouteBuilder(
    this.appRoute, {
    required this.currentLocation,
    this.params = const <String, String>{},
    this.queryParams = const <String, String>{},
  });

  // easy way to get this is
  // GoRouter.of(context).routeInformationProvider.value.location;
  final String currentLocation;
  final AppRoute appRoute;
  final Map<String, String> params;
  final Map<String, String> queryParams;

  //TODO: Add support to init the route with a name in a String format

  /// This is gonna return the PATH (URL)
  /// that we use to navigate to specific place in the app
  /// ```dart
  /// context.go(appRouteBuilder.buildFullPath())
  /// ```
  String? buildFullPath() {
    switch (appRoute) {
      case AppRoute.home:
      case AppRoute.movies:
        return namedPathFor(AppRoute.movies);
      case AppRoute.tvShows:
        return namedPathFor(AppRoute.tvShows);
      case AppRoute.video:
        return namedPathFor(AppRoute.video);
      case AppRoute.detail:
        if (params['id'] == null) return '';
        final dp =
            namedPathFor(AppRoute.detail).replaceAll(':id', params['id']!);
        if (queryParams.isEmpty) {
          return '$currentLocation/$dp';
        } else {
          var queryStr = '';
          queryParams.forEach((key, value) {
            // ignore: prefer_interpolation_to_compose_strings
            queryStr = queryStr + ',$key=$value';
          });
          // remove 1st coma
          queryStr = queryStr.substring(1, queryStr.length);
          return '$currentLocation/$dp?$queryStr';
        }
    }
  }
}

// we have this to avoid copy paste hard coding, and we can even test it
@visibleForTesting
String namedPathFor(AppRoute route) {
  switch (route) {
    case AppRoute.home:
      return '/home/:tab(movies|tv_shows)';

    // child of home
    case AppRoute.detail:
      return 'details/:id';

    case AppRoute.video:
      return '/video';

    case AppRoute.movies:
      return '/home/movies';

    case AppRoute.tvShows:
      return '/home/tv_shows';
  }
}
