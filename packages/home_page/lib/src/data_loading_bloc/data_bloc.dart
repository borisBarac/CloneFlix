// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:developer';

import 'package:api_core/api_core.dart';
import 'package:api_core/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_page/src/mappers/home_page_ui_mapper.dart';
import 'package:home_page/src/repository/home_page_network_loadable.dart';
import 'package:shared/shared.dart';

part 'data_event.dart';
part 'data_state.dart';

/// we gonna use this mixin to register movie block in the widget tree
mixin MovieLoadBlock on Bloc<DataEvent, DataState> {}

/// we gonna use this mixin to register tvShow block in the widget tree
mixin TvShowLoadBlock on Bloc<DataEvent, DataState> {}

/// We are gonna use this BLOC to load data for the home page
/// Idea is to create one for movies, and one for tv shows
class DataLoadBloc extends Bloc<DataEvent, DataState>
    with MovieLoadBlock, TvShowLoadBlock {
  /// takes a repository that implements HomePageNetworkLoadable and a UI Mapper
  DataLoadBloc(this.repository, this.uiMapper) : super(emptyState) {
    on<DataEvent>((event, emit) async {
      switch (event.runtimeType) {
        case LoadAll:
          if ((event as LoadAll).isPullToRefresh == false) {
            emit(DataStateLoading());
          }
          try {
            final List<dynamic> results;
            switch (event.type) {
              case LoadType.movie:
                results = await repository.getPopular<MoviePaginatedResults>()
                    as List<MoviePaginatedResults>;
                break;
              case LoadType.tv:
                results = await repository.getPopular<TVPaginatedResults>(
                  RouteType.tv,
                ) as List<TVPaginatedResults>;
                break;
            }

            if (results.isEmpty) {
              emit(emptyState);
            } else {
              final uiDataArr = results
                  .map((e) {
                    if (e is MoviePaginatedResults) {
                      return uiMapper.createFromMovieResults(e);
                    } else if (e is TVPaginatedResults) {
                      return uiMapper.createFromTvResults(e);
                    }
                  })
                  .expand((element) => element ?? [])
                  .map((e) => e as ListItemUIModel)
                  .toList();

              emit(DataStateFull(data: uiDataArr));
            }
          } catch (e) {
            log('DataLoadBloc: Error: $e');
            emit(errorState);
          }
          break;
        case AddData:
          // not supported yet
          break;
      }
    });
  }

  /// @nodoc
  HomePageNetworkLoadable repository;

  /// @nodoc
  HomePageUIMapper uiMapper;
}

@visibleForTesting
// ignore: public_member_api_docs
const emptyState = DataStateEmpty('There is no data :(');

@visibleForTesting
// ignore: lines_longer_than_80_chars, public_member_api_docs
const errorState = DataStateEmpty('We could not load the data, try to refresh');
