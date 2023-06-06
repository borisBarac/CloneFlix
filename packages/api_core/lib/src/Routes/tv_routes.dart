// ignore_for_file: public_member_api_docs
import 'package:api_core/src/Routes/routes.dart';

/// GET /tv/{tv_id}/season/{season_number}
///
class TvSeasonDetailsRoute extends Routes {
  TvSeasonDetailsRoute(
    String domain,
    String subDomain,
    String apiVersion,
    this.tvId,
    this.seasonNumber,
  ) : super(domain, subDomain, apiVersion, RouteType.tv);

  final int tvId;
  final int seasonNumber;

  @override
  String get basePath {
    return '/$apiVersion/tv/$tvId/season/$seasonNumber';
  }

  @override
  Uri? getUrl() => Uri.https(fullDomain, basePath);
}
