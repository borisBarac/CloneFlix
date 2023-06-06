// ignore_for_file: public_member_api_docs
import 'package:api_core/src/Routes/routes.dart';
import 'package:api_core/src/api_exception.dart';

class DetailsRoute extends Routes {
  DetailsRoute(
    super.domain,
    super.subDomain,
    super.apiVersion,
    super.type,
    this.id,
  );
  final int id;

  @override
  String get basePath {
    if (typePrefix == '') throw ApiException.routeError;
    return '/$apiVersion/$typePrefix/$id';
  }

  @override
  Uri? getUrl() => Uri.https(fullDomain, basePath);
}

class GetPopularRoute extends Routes {
  GetPopularRoute(
    super.domain,
    super.subDomain,
    super.apiVersion,
    super.type,
    this.page,
  );

  final int? page;

  @override
  String get basePath {
    if (typePrefix == '') throw ApiException.routeError;
    return '/$apiVersion/$typePrefix/popular';
  }

  @override
  Uri? getUrl() =>
      Uri.https(fullDomain, basePath, {'page': (page ?? 1).toString()});
}

class GetSimilarRoute extends Routes {
  GetSimilarRoute(
    super.domain,
    super.subDomain,
    super.apiVersion,
    super.type,
    this.similarId,
    this.page,
  );
  final int similarId;
  final int page;

  @override
  String get basePath {
    if (typePrefix == '') throw ApiException.routeError;
    return '/$apiVersion/$typePrefix/$similarId/similar';
  }

  @override
  Uri? getUrl() => Uri.https(fullDomain, basePath, {'page': '$page'});
}
