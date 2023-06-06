// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:detail_page/src/data/detail_page_network_loadable.dart';
import 'package:detail_page/src/mappers/detail_page_mapper.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

/// We are gonna use this BLOC to load data for the dome page
/// <br> We gonna get all the data we need here,
/// and we gonna make the UI model from that data
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  /// takes a repository that implements HomePageNetworkLoadable and a UI Mapper
  DetailBloc(this.repository, this.mapper)
      : super(
          const DetailStateEmpty(
            message: 'We could not get data',
            enableReload: false,
          ),
        ) {
    on<DetailEvent>((event, emit) async {
      switch (event.runtimeType) {
        case LoadDetails:
          final id = (event as LoadDetails).id;
          final type = event.type;

          emit(DetailStateLoading());
          try {
            final mixedApiResults = await _getNetworksResults(id, type);
            assert(
              mixedApiResults.length == 2,
              'wrong set up of network call in DetailBloc',
            );
            final model = mapper.createFrom(
              mixedApiResults[0],
              mixedApiResults[1] as List,
              type,
            );
            emit(DetailStateFull(model));
          } catch (e) {
            log('DataLoadBloc: Error: $e');
            emit(
              DetailStateEmpty(
                id: id,
                type: type,
                message: 'We could not get data',
              ),
            );
          }
          break;
      }
    });
  }

  /// @nodoc
  DetailPageNetworkLoadable repository;

  /// @nodoc
  DetailPageUIMapper mapper;

  Future<List<dynamic>> _getNetworksResults(int id, DetailsType type) async {
    switch (type) {
      case DetailsType.movie:
        // bug is here. we get [details,[similar, similar, similar, similar] ]
        // and we need [details, similar, similar, similar, similar]
        return Future.wait([
          repository.getMovieDetails(id),
          repository.getSimilarMovies(id),
        ]);
      case DetailsType.tv:
        final details = await repository.getTvShowDetails(id);
        final seasonNumbers = details.numberOfSeasons ?? 1;

        final seasons = await Future.wait(
          _positiveIntegers
              .skip(1)
              .take(seasonNumbers)
              .map((e) => repository.getSeasonForShow(id, seasonNumber: e)),
        );

        return [details, seasons];
    }
  }
}

/// the list of positive integers starting from 0
Iterable<int> get _positiveIntegers sync* {
  var i = 0;
  while (true) {
    yield i++;
  }
}
