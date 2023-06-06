// ignore_for_file: public_member_api_docs

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/mappers/detail_page_mapper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

typedef PlayVideoBlock = void Function(int videoId);

/// We use this model in Bloc to be able to create the widget from the model
/// That is why we need to provide all the data that we need to display
/// and control the UI
@immutable
class DetailPageModel extends Equatable {
  const DetailPageModel({
    required this.type,
    required this.posterUrl,
    required this.backdropImageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.detailsRowModels,
    this.navigateTo,
    this.playVideoOf,
  });
  final DetailsType type;
  final String posterUrl;
  final String backdropImageUrl;
  final String title;
  final String description;
  final double rating;

  final NavigateToBlock? navigateTo;

  final PlayVideoBlock? playVideoOf;

  final List<List<ListItemUIModel>> detailsRowModels;

  List<ListItemUIModel> getItemsForRow(int i) {
    if (detailsRowModels.length > i) {
      return detailsRowModels[i];
    }

    return [];
  }

  @override
  List<Object?> get props => [];

  DetailPageModel copyWith({
    DetailsType? type,
    String? posterUrl,
    String? backdropImageUrl,
    String? title,
    String? description,
    double? rating,
    NavigateToBlock? navigateTo,
    PlayVideoBlock? playVideoOf,
    List<List<ListItemUIModel>>? detailsRowModels,
  }) {
    return DetailPageModel(
      type: type ?? this.type,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropImageUrl: backdropImageUrl ?? this.backdropImageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      navigateTo: navigateTo ?? this.navigateTo,
      playVideoOf: playVideoOf ?? this.playVideoOf,
      detailsRowModels: detailsRowModels ?? this.detailsRowModels,
    );
  }

  // helper vars
  String get posterUrlSting {
    return ImageRoute(posterUrl, ImageRouteType.poster, ImageRouteQuality.M)
        .getUrl()
        .toString();
  }

  String get backdropImageUrlString {
    return ImageRoute(
      backdropImageUrl,
      ImageRouteType.backdrop,
      ImageRouteQuality.M,
    ).getUrl().toString();
  }
}

Future<DetailPageModel> createMockedDetailPageModel() async {
  final mixedApiResults = await Future.wait([
    createMovieDetailsFromMock(packagePrefix: 'packages/api_core'),
    Future.wait([
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
      createPaginatedMoviesFromMock(packagePrefix: 'packages/api_core'),
    ]),
  ]);

  return DetailPageUIMapper().createFrom(
    mixedApiResults[0],
    mixedApiResults[1] as List,
    DetailsType.movie,
  );
}
