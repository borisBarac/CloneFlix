/// Mappers from domain model to ui model

import 'package:api_core/api_core.dart'
    show TVPaginatedResults, MoviePaginatedResults;
import 'package:shared/shared.dart' show ListItemUIModel, NavigateToBlock;

/// Mapper from Api to UI Model
class HomePageUIMapper {
  ///
  HomePageUIMapper({this.detailClickBlock});

  /// block that gets activated
  NavigateToBlock? detailClickBlock;

  ///
  List<ListItemUIModel> createFromTvResults(TVPaginatedResults apiModel) {
    return apiModel.results
        .map(
          (e) => ListItemUIModel(
            click: detailClickBlock,
            id: e.id,
            title: e.name,
            posterUrl: e.posterPath ?? '',
          ),
        )
        .toList();
  }

  ///
  List<ListItemUIModel> createFromMovieResults(
    MoviePaginatedResults apiModel,
  ) {
    return apiModel.results
        .map(
          (e) => ListItemUIModel(
            click: detailClickBlock,
            id: e.id,
            title: e.title,
            posterUrl: e.posterPath ?? '',
          ),
        )
        .toList();
  }
}
