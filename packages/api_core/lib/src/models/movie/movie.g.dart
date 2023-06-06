// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDetail _$$_MovieDetailFromJson(Map<String, dynamic> json) =>
    _$_MovieDetail(
      backdropPath: json['backdrop_path'] as String?,
      homepage: json['homepage'] as String?,
      id: json['id'] as int,
      overview: json['overview'] as String?,
      tagline: json['tagline'] as String?,
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MovieDetailToJson(_$_MovieDetail instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'homepage': instance.homepage,
      'id': instance.id,
      'overview': instance.overview,
      'tagline': instance.tagline,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };

_$_MoviePaginatedResults _$$_MoviePaginatedResultsFromJson(
        Map<String, dynamic> json) =>
    _$_MoviePaginatedResults(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MoviePaginatedResultsToJson(
        _$_MoviePaginatedResults instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };

_$_MovieResult _$$_MovieResultFromJson(Map<String, dynamic> json) =>
    _$_MovieResult(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_MovieResultToJson(_$_MovieResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
