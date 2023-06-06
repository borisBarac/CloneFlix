// ignore: lines_longer_than_80_chars
// ignore_for_file: non_constant_identifier_names, public_member_api_docs, invalid_annotation_target

import 'dart:convert';

import 'package:api_core/src/models/json_model_type.dart';
import 'package:api_core/src/models/production_company/production_company.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieDetail extends JsonSerializableModel with _$MovieDetail {
  const factory MovieDetail({
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'homepage') required String? homepage,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'overview') required String? overview,
    @JsonKey(name: 'tagline') required String? tagline,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'production_companies')
        required List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _MovieDetail;

  // ignore: lines_longer_than_80_chars
  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}

/// freezed does not support generics so we need double classes in some cases
@freezed
class MoviePaginatedResults extends PaginatedJsonSerializableModel
    with _$MoviePaginatedResults {
  const factory MoviePaginatedResults({
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_results') required int totalResults,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'results') required List<MovieResult> results,
  }) = _MoviePaginatedResults;

  // ignore: lines_longer_than_80_chars
  factory MoviePaginatedResults.fromJson(Map<String, dynamic> json) =>
      _$MoviePaginatedResultsFromJson(json);
}

@freezed
class MovieResult extends JsonSerializableModel with _$MovieResult {
  const factory MovieResult({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'overview') required String? overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
  }) = _MovieResult;

  // ignore: lines_longer_than_80_chars
  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);
}

Future<MoviePaginatedResults> createPaginatedMoviesFromMock({
  String? packagePrefix,
}) async {
  final path = packagePrefix == null
      ? 'assets/mocks/movie_popular.json'
      : '$packagePrefix/assets/mocks/movie_popular.json';
  final data = await rootBundle.loadString(path);
  final json = jsonDecode(data) as Map<String, dynamic>;
  return MoviePaginatedResults.fromJson(json);
}

Future<MovieDetail> createMovieDetailsFromMock({
  String? packagePrefix,
}) async {
  final path = packagePrefix == null
      ? 'assets/mocks/movie_details.json'
      : '$packagePrefix/assets/mocks/movie_details.json';
  final data = await rootBundle.loadString(path);
  final json = jsonDecode(data) as Map<String, dynamic>;
  return MovieDetail.fromJson(json);
}
