// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShowDetail _$$_ShowDetailFromJson(Map<String, dynamic> json) =>
    _$_ShowDetail(
      backdropPath: json['backdrop_path'] as String?,
      homepage: json['homepage'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      numberOfSeasons: json['number_of_seasons'] as int?,
      numberOfEpisodes: json['number_of_episodes'] as int?,
      popularity: (json['popularity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ShowDetailToJson(_$_ShowDetail instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'homepage': instance.homepage,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'number_of_seasons': instance.numberOfSeasons,
      'number_of_episodes': instance.numberOfEpisodes,
      'popularity': instance.popularity,
    };

_$_TvSeason _$$_TvSeasonFromJson(Map<String, dynamic> json) => _$_TvSeason(
      id: json['id'] as int,
      seasonNumber: json['season_number'] as int,
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String,
      overview: json['overview'] as String,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TvEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TvSeasonToJson(_$_TvSeason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'season_number': instance.seasonNumber,
      'poster_path': instance.posterPath,
      'name': instance.name,
      'overview': instance.overview,
      'episodes': instance.episodes,
    };

_$_TvEpisode _$$_TvEpisodeFromJson(Map<String, dynamic> json) => _$_TvEpisode(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      seasonNumber: json['season_number'] as int,
      episodeNumber: json['episode_number'] as int,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_TvEpisodeToJson(_$_TvEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'season_number': instance.seasonNumber,
      'episode_number': instance.episodeNumber,
      'poster_path': instance.posterPath,
    };

_$_TVPaginatedResults _$$_TVPaginatedResultsFromJson(
        Map<String, dynamic> json) =>
    _$_TVPaginatedResults(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TVResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TVPaginatedResultsToJson(
        _$_TVPaginatedResults instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };

_$_TVResults _$$_TVResultsFromJson(Map<String, dynamic> json) => _$_TVResults(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_TVResultsToJson(_$_TVResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
