// ignore_for_file: public_member_api_docs

import 'package:api_core/api_core.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:shared/shared.dart';

/// Mapper from Api to UI Model
class DetailPageUIMapper {
  DetailPageUIMapper({this.navigateTo, this.playVideoOf});

  NavigateToBlock? navigateTo;

  PlayVideoBlock? playVideoOf;

  /// nodoc
  DetailPageModel createFrom(
    dynamic details,
    List<dynamic> related,
    DetailsType type,
  ) =>
      type == DetailsType.movie
          ? _createFromMovies(
              details as MovieDetail,
              related as List<MoviePaginatedResults>,
            )
          : _createFromTvShow(
              details as ShowDetail,
              related as List<TvSeason>,
            );

  DetailPageModel _createFromMovies(
    MovieDetail details,
    List<MoviePaginatedResults> related,
  ) {
    final subRowModels = related.map(
      (apiModel) {
        return apiModel.results
            .map(
              (e) => ListItemUIModel(
                click: navigateTo,
                id: e.id,
                title: e.title,
                posterUrl: e.posterPath ?? '',
              ),
            )
            .toList();
      },
    ).toList();

    return DetailPageModel(
      type: DetailsType.movie,
      posterUrl: details.posterPath ?? '',
      backdropImageUrl: details.backdropPath ?? '',
      title: details.title,
      description: details.overview ?? '',
      rating: details.voteAverage,
      detailsRowModels: subRowModels,
      playVideoOf: playVideoOf,
    );
  }

  DetailPageModel _createFromTvShow(
    ShowDetail details,
    List<TvSeason> seasons,
  ) {
    final subRowModels = seasons.map(
      (apiModel) {
        return apiModel.episodes
            .map(
              (e) => ListItemUIModel(
                click: navigateTo,
                id: e.id,
                title: e.name,
                posterUrl: e.posterPath ?? details.posterPath ?? '',
              ),
            )
            .toList();
      },
    ).toList();

    return DetailPageModel(
      type: DetailsType.tv,
      posterUrl: details.posterPath ?? '',
      backdropImageUrl: details.backdropPath ?? '',
      title: details.name,
      description: details.overview ?? '',
      rating: details.voteAverage ?? 0,
      detailsRowModels: subRowModels,
      playVideoOf: playVideoOf,
    );
  }
}
