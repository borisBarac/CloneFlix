// ignore_for_file: public_member_api_docs

enum RouteType { tv, movie, image, none }

/// Network routes used with out REST API
abstract class Routes {
  /// Main constructor
  /// example of a full domain: https://api.themoviedb.org/3
  const Routes(this.domain, this.subDomain, this.apiVersion, this.type);

  /// Api Domain
  final String domain;

  /// API Subdomain - usually connected to environments
  final String subDomain;

  /// Current API Version
  final String apiVersion;

  final RouteType type;

  String get basePath;

  String get fullDomain {
    return '$subDomain.$domain';
  }

  String get typePrefix {
    switch (type) {
      case RouteType.movie:
        return 'movie';
      case RouteType.tv:
        return 'tv';
      // ignore: no_default_cases
      case RouteType.image:
      case RouteType.none:
        return '';
    }
  }

  /// Get movie details URI
  Uri? getUrl();
}
