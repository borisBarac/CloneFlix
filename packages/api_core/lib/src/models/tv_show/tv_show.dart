// ignore_for_file: non_constant_identifier_names, public_member_api_docs, invalid_annotation_target

import 'dart:convert';

import 'package:api_core/api_core.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show.freezed.dart';
part 'tv_show.g.dart';

@freezed
class ShowDetail extends JsonSerializableModel with _$ShowDetail {
  const factory ShowDetail({
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'homepage') required String? homepage,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') required String? overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'vote_average') required double? voteAverage,
    @JsonKey(name: 'number_of_seasons') required int? numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') required int? numberOfEpisodes,
    @JsonKey(name: 'popularity') required double? popularity,
  }) = _ShowDetail;

  // ignore: lines_longer_than_80_chars
  factory ShowDetail.fromJson(Map<String, dynamic> json) =>
      _$ShowDetailFromJson(json);
}

/// you get this by calling : GET /tv/{tv_id}/season/{season_number}
@freezed
class TvSeason extends JsonSerializableModel with _$TvSeason {
  const factory TvSeason({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'episodes') required List<TvEpisode> episodes,
  }) = _TvSeason;

  // ignore: lines_longer_than_80_chars
  factory TvSeason.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonFromJson(json);
}

@freezed
class TvEpisode extends JsonSerializableModel with _$TvEpisode {
  const factory TvEpisode({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'episode_number') required int episodeNumber,
    @JsonKey(name: 'poster_path') required String? posterPath,
  }) = _TvEpisode;

  // ignore: lines_longer_than_80_chars
  factory TvEpisode.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeFromJson(json);
}

/// freezed does not support generics so we need double classes in some cases
@freezed
class TVPaginatedResults extends PaginatedJsonSerializableModel
    with _$TVPaginatedResults {
  const factory TVPaginatedResults({
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_results') required int totalResults,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'results') required List<TVResults> results,
  }) = _TVPaginatedResults;

  // ignore: lines_longer_than_80_chars
  factory TVPaginatedResults.fromJson(Map<String, dynamic> json) =>
      _$TVPaginatedResultsFromJson(json);
}

@freezed
class TVResults extends JsonSerializableModel with _$TVResults {
  const factory TVResults({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'overview') required String? overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
  }) = _TVResults;

  // ignore: lines_longer_than_80_chars
  factory TVResults.fromJson(Map<String, dynamic> json) =>
      _$TVResultsFromJson(json);
}

Future<ShowDetail> createShowDetailsFromMock({
  String? packagePrefix,
}) async {
  final path = packagePrefix == null
      ? 'assets/mocks/tv_details.json'
      : '$packagePrefix/assets/mocks/tv_details.json';
  final data = await rootBundle.loadString(path);
  final json = jsonDecode(data) as Map<String, dynamic>;
  return ShowDetail.fromJson(json);
}

Future<TvSeason> createTVSeasonFromMock({
  String? packagePrefix,
}) async {
  final path = packagePrefix == null
      ? 'assets/mocks/tv_season_details.json'
      : '$packagePrefix/assets/mocks/tv_season_details.json';
  final data = await rootBundle.loadString(path);
  final json = jsonDecode(data) as Map<String, dynamic>;
  return TvSeason.fromJson(json);
}

Future<TVPaginatedResults> createTVPaginatedResultsFromMock({
  String? packagePrefix,
}) async {
  final path = packagePrefix == null
      ? 'assets/mocks/tv_popular.json'
      : '$packagePrefix/assets/mocks/tv_popular.json';
  final data = await rootBundle.loadString(path);
  final json = jsonDecode(data) as Map<String, dynamic>;
  return TVPaginatedResults.fromJson(json);
}
