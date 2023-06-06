// ignore_for_file: public_member_api_docs

import 'package:api_core/src/models/movie/movie.dart';
import 'package:api_core/src/models/tv_show/tv_show.dart';

/// Enum used in abstract factory
enum JsonModelType {
  movieDetail,
  moviePaginatedResults,
  tvPaginatedResults,
  tvSeason,
  showDetail,
  unknown,
}

/// Abstract class we use a base for out JSON model classes
abstract class JsonSerializableModel {
  /// dev const
  JsonSerializableModel();

  /// Main factory
  factory JsonSerializableModel.fromJson(
    JsonModelType type,
    Map<String, dynamic> json,
  ) {
    switch (type) {
      case JsonModelType.movieDetail:
        return MovieDetail.fromJson(json);
      case JsonModelType.moviePaginatedResults:
        return MoviePaginatedResults.fromJson(json);
      case JsonModelType.showDetail:
        return ShowDetail.fromJson(json);
      case JsonModelType.tvSeason:
        return TvSeason.fromJson(json);
      case JsonModelType.tvPaginatedResults:
        return TVPaginatedResults.fromJson(json);
      case JsonModelType.unknown:
        throw Exception('Unknown model');
    }
  }
}

abstract class PaginatedJsonSerializableModel extends JsonSerializableModel {
  int get page;
  List<JsonSerializableModel> get results;
}
