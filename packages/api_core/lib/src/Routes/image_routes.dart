// ignore_for_file: public_member_api_docs
import 'dart:developer';

import 'package:api_core/src/Routes/routes.dart';

class ImageRoute extends Routes {
  /// Always uses the same domain
  /// https://image.tmdb.org/t/p/
  ///
  /// Full example would be: https://image.tmdb.org/t/p/w300/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg
  const ImageRoute(
    this.fileName,
    this.imageType,
    this.quality, {
    String domain = 'tmdb.org',
    String subDomain = 'image',
    String apiVersion = '',
  }) : super(domain, subDomain, apiVersion, RouteType.image);

  final String fileName;
  final ImageRouteType imageType;
  final ImageRouteQuality quality;

  String get qualityPrefix {
    final list = imageType.sizes ?? ['original'];
    switch (quality) {
      case ImageRouteQuality.S:
        return list.first;
      case ImageRouteQuality.M:
        final len = list.length;
        return list[(len / 2).floor()];
      case ImageRouteQuality.L:
        return list.last;
    }
  }

  @override
  String get basePath =>
      '/t/p/$qualityPrefix/${fileName.startsWith('/') ? fileName.replaceFirst('/', '') : fileName}';

  @override
  Uri? getUrl() {
    try {
      return Uri.https(fullDomain, basePath);
    } catch (e) {
      log('Error: e.toString()');
      return null;
    }
  }
}

final _config = {
  'backdrop_sizes': ['w300', 'w780', 'w1280', 'original'],
  'logo_sizes': ['w45', 'w92', 'w154', 'w185', 'w300', 'w500', 'original'],
  'poster_sizes': ['w92', 'w154', 'w185', 'w342', 'w500', 'w780', 'original'],
  'profile_sizes': ['w45', 'w185', 'h632', 'original'],
  'still_sizes': ['w92', 'w185', 'w300', 'original']
};

enum ImageRouteType {
  backdrop,
  logo,
  poster,
  profile;

  List<String>? get sizes {
    switch (this) {
      case ImageRouteType.backdrop:
        return _config['backdrop_sizes']!;
      case ImageRouteType.logo:
        return _config['logo_sizes']!;
      case ImageRouteType.poster:
        return _config['poster_sizes']!;
      case ImageRouteType.profile:
        return _config['profile_sizes']!;
    }
  }
}

enum ImageRouteQuality {
  S,
  M,
  L;
}
