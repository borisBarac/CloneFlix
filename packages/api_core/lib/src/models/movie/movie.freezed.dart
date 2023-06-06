// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return _MovieDetail.fromJson(json);
}

/// @nodoc
mixin _$MovieDetail {
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'homepage')
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagline')
  String? get tagline => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieDetailCopyWith<MovieDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailCopyWith<$Res> {
  factory $MovieDetailCopyWith(
          MovieDetail value, $Res Function(MovieDetail) then) =
      _$MovieDetailCopyWithImpl<$Res, MovieDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'backdrop_path')
          String? backdropPath,
      @JsonKey(name: 'homepage')
          String? homepage,
      @JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'overview')
          String? overview,
      @JsonKey(name: 'tagline')
          String? tagline,
      @JsonKey(name: 'poster_path')
          String? posterPath,
      @JsonKey(name: 'production_companies')
          List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'title')
          String title,
      @JsonKey(name: 'vote_average')
          double voteAverage});
}

/// @nodoc
class _$MovieDetailCopyWithImpl<$Res, $Val extends MovieDetail>
    implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? overview = freezed,
    Object? tagline = freezed,
    Object? posterPath = freezed,
    Object? productionCompanies = null,
    Object? title = null,
    Object? voteAverage = null,
  }) {
    return _then(_value.copyWith(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: null == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieDetailCopyWith<$Res>
    implements $MovieDetailCopyWith<$Res> {
  factory _$$_MovieDetailCopyWith(
          _$_MovieDetail value, $Res Function(_$_MovieDetail) then) =
      __$$_MovieDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'backdrop_path')
          String? backdropPath,
      @JsonKey(name: 'homepage')
          String? homepage,
      @JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'overview')
          String? overview,
      @JsonKey(name: 'tagline')
          String? tagline,
      @JsonKey(name: 'poster_path')
          String? posterPath,
      @JsonKey(name: 'production_companies')
          List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'title')
          String title,
      @JsonKey(name: 'vote_average')
          double voteAverage});
}

/// @nodoc
class __$$_MovieDetailCopyWithImpl<$Res>
    extends _$MovieDetailCopyWithImpl<$Res, _$_MovieDetail>
    implements _$$_MovieDetailCopyWith<$Res> {
  __$$_MovieDetailCopyWithImpl(
      _$_MovieDetail _value, $Res Function(_$_MovieDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? overview = freezed,
    Object? tagline = freezed,
    Object? posterPath = freezed,
    Object? productionCompanies = null,
    Object? title = null,
    Object? voteAverage = null,
  }) {
    return _then(_$_MovieDetail(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: null == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieDetail implements _MovieDetail {
  const _$_MovieDetail(
      {@JsonKey(name: 'backdrop_path')
          required this.backdropPath,
      @JsonKey(name: 'homepage')
          required this.homepage,
      @JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'overview')
          required this.overview,
      @JsonKey(name: 'tagline')
          required this.tagline,
      @JsonKey(name: 'poster_path')
          required this.posterPath,
      @JsonKey(name: 'production_companies')
          required final List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'title')
          required this.title,
      @JsonKey(name: 'vote_average')
          required this.voteAverage})
      : _productionCompanies = productionCompanies;

  factory _$_MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$$_MovieDetailFromJson(json);

  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'homepage')
  final String? homepage;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'tagline')
  final String? tagline;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<ProductionCompany> _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies {
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productionCompanies);
  }

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @override
  String toString() {
    return 'MovieDetail(backdropPath: $backdropPath, homepage: $homepage, id: $id, overview: $overview, tagline: $tagline, posterPath: $posterPath, productionCompanies: $productionCompanies, title: $title, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetail &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      backdropPath,
      homepage,
      id,
      overview,
      tagline,
      posterPath,
      const DeepCollectionEquality().hash(_productionCompanies),
      title,
      voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieDetailCopyWith<_$_MovieDetail> get copyWith =>
      __$$_MovieDetailCopyWithImpl<_$_MovieDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieDetailToJson(
      this,
    );
  }
}

abstract class _MovieDetail implements MovieDetail {
  const factory _MovieDetail(
      {@JsonKey(name: 'backdrop_path')
          required final String? backdropPath,
      @JsonKey(name: 'homepage')
          required final String? homepage,
      @JsonKey(name: 'id')
          required final int id,
      @JsonKey(name: 'overview')
          required final String? overview,
      @JsonKey(name: 'tagline')
          required final String? tagline,
      @JsonKey(name: 'poster_path')
          required final String? posterPath,
      @JsonKey(name: 'production_companies')
          required final List<ProductionCompany> productionCompanies,
      @JsonKey(name: 'title')
          required final String title,
      @JsonKey(name: 'vote_average')
          required final double voteAverage}) = _$_MovieDetail;

  factory _MovieDetail.fromJson(Map<String, dynamic> json) =
      _$_MovieDetail.fromJson;

  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'homepage')
  String? get homepage;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'tagline')
  String? get tagline;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get productionCompanies;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$_MovieDetailCopyWith<_$_MovieDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

MoviePaginatedResults _$MoviePaginatedResultsFromJson(
    Map<String, dynamic> json) {
  return _MoviePaginatedResults.fromJson(json);
}

/// @nodoc
mixin _$MoviePaginatedResults {
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<MovieResult> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviePaginatedResultsCopyWith<MoviePaginatedResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviePaginatedResultsCopyWith<$Res> {
  factory $MoviePaginatedResultsCopyWith(MoviePaginatedResults value,
          $Res Function(MoviePaginatedResults) then) =
      _$MoviePaginatedResultsCopyWithImpl<$Res, MoviePaginatedResults>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'results') List<MovieResult> results});
}

/// @nodoc
class _$MoviePaginatedResultsCopyWithImpl<$Res,
        $Val extends MoviePaginatedResults>
    implements $MoviePaginatedResultsCopyWith<$Res> {
  _$MoviePaginatedResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalResults = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviePaginatedResultsCopyWith<$Res>
    implements $MoviePaginatedResultsCopyWith<$Res> {
  factory _$$_MoviePaginatedResultsCopyWith(_$_MoviePaginatedResults value,
          $Res Function(_$_MoviePaginatedResults) then) =
      __$$_MoviePaginatedResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'results') List<MovieResult> results});
}

/// @nodoc
class __$$_MoviePaginatedResultsCopyWithImpl<$Res>
    extends _$MoviePaginatedResultsCopyWithImpl<$Res, _$_MoviePaginatedResults>
    implements _$$_MoviePaginatedResultsCopyWith<$Res> {
  __$$_MoviePaginatedResultsCopyWithImpl(_$_MoviePaginatedResults _value,
      $Res Function(_$_MoviePaginatedResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalResults = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_$_MoviePaginatedResults(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoviePaginatedResults implements _MoviePaginatedResults {
  const _$_MoviePaginatedResults(
      {@JsonKey(name: 'page') required this.page,
      @JsonKey(name: 'total_results') required this.totalResults,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'results') required final List<MovieResult> results})
      : _results = results;

  factory _$_MoviePaginatedResults.fromJson(Map<String, dynamic> json) =>
      _$$_MoviePaginatedResultsFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<MovieResult> _results;
  @override
  @JsonKey(name: 'results')
  List<MovieResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MoviePaginatedResults(page: $page, totalResults: $totalResults, totalPages: $totalPages, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviePaginatedResults &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalResults, totalPages,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviePaginatedResultsCopyWith<_$_MoviePaginatedResults> get copyWith =>
      __$$_MoviePaginatedResultsCopyWithImpl<_$_MoviePaginatedResults>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoviePaginatedResultsToJson(
      this,
    );
  }
}

abstract class _MoviePaginatedResults implements MoviePaginatedResults {
  const factory _MoviePaginatedResults(
          {@JsonKey(name: 'page') required final int page,
          @JsonKey(name: 'total_results') required final int totalResults,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'results') required final List<MovieResult> results}) =
      _$_MoviePaginatedResults;

  factory _MoviePaginatedResults.fromJson(Map<String, dynamic> json) =
      _$_MoviePaginatedResults.fromJson;

  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'results')
  List<MovieResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$_MoviePaginatedResultsCopyWith<_$_MoviePaginatedResults> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieResult _$MovieResultFromJson(Map<String, dynamic> json) {
  return _MovieResult.fromJson(json);
}

/// @nodoc
mixin _$MovieResult {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieResultCopyWith<MovieResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResultCopyWith<$Res> {
  factory $MovieResultCopyWith(
          MovieResult value, $Res Function(MovieResult) then) =
      _$MovieResultCopyWithImpl<$Res, MovieResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'poster_path') String? posterPath});
}

/// @nodoc
class _$MovieResultCopyWithImpl<$Res, $Val extends MovieResult>
    implements $MovieResultCopyWith<$Res> {
  _$MovieResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieResultCopyWith<$Res>
    implements $MovieResultCopyWith<$Res> {
  factory _$$_MovieResultCopyWith(
          _$_MovieResult value, $Res Function(_$_MovieResult) then) =
      __$$_MovieResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'poster_path') String? posterPath});
}

/// @nodoc
class __$$_MovieResultCopyWithImpl<$Res>
    extends _$MovieResultCopyWithImpl<$Res, _$_MovieResult>
    implements _$$_MovieResultCopyWith<$Res> {
  __$$_MovieResultCopyWithImpl(
      _$_MovieResult _value, $Res Function(_$_MovieResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
  }) {
    return _then(_$_MovieResult(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieResult implements _MovieResult {
  const _$_MovieResult(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'overview') required this.overview,
      @JsonKey(name: 'poster_path') required this.posterPath});

  factory _$_MovieResult.fromJson(Map<String, dynamic> json) =>
      _$$_MovieResultFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @override
  String toString() {
    return 'MovieResult(id: $id, title: $title, overview: $overview, posterPath: $posterPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, overview, posterPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieResultCopyWith<_$_MovieResult> get copyWith =>
      __$$_MovieResultCopyWithImpl<_$_MovieResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieResultToJson(
      this,
    );
  }
}

abstract class _MovieResult implements MovieResult {
  const factory _MovieResult(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'overview') required final String? overview,
          @JsonKey(name: 'poster_path') required final String? posterPath}) =
      _$_MovieResult;

  factory _MovieResult.fromJson(Map<String, dynamic> json) =
      _$_MovieResult.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$_MovieResultCopyWith<_$_MovieResult> get copyWith =>
      throw _privateConstructorUsedError;
}
