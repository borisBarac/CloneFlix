/// A Very Good Project created by Very Good CLI.
library detail_page;

import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/data/detail_page_network_loadable.dart';
import 'package:detail_page/src/data/detail_page_repository.dart';
import 'package:detail_page/src/mappers/detail_page_mapper.dart';
import 'package:detail_page/src/ui/detail_page.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

export './src/blocks/details/detail_bloc.dart' show DetailsType;
export './src/ui/detail_page.dart' show DetailPage;

/// Public method for creating detail page.
/// <br> Meant to be used form other packages
/// <br> If **navigateTo** is set to NULL,
/// the page is gonna reload it self with the clicked item
/// <br> To disable this action, please pass a empty function
Widget createDetailPage({
  required int id,
  required DetailsType type,
  required bool mockNetwork,
  NavigateToBlock? navigateTo,
  PlayVideoBlock? playVideoOf,
}) {
  final mapper = DetailPageUIMapper(
    navigateTo: navigateTo,
    playVideoOf: playVideoOf,
  );
  final repo = mockNetwork
      ? MockedDetailPageNetworkLoadable()
      : DetailPageRepository.initWithGetIt();
  final detailsBloc = DetailBloc(repo, mapper);

  return DetailPage(detailsBloc..add(LoadDetails(id, type)));
}
