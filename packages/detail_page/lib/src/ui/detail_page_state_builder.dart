import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page.dart';
import 'package:detail_page/src/ui/detail_page_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

/// Builder that is gonna be used in the main bloc of details page
extension DetailPageStateBuilder on DetailPage {
  /// builds the state and injects the default actions
  Widget buildWidgetWithState<BlockType extends Bloc<DetailEvent, DetailState>>(
    BuildContext context,
    DetailState state,
  ) {
    switch (state.runtimeType) {
      case DetailStateLoading:
        return const LoadingIndicator(0.25);
      case DetailStateFull:
        var uiModel = (state as DetailStateFull).model;
        final pageType = uiModel.type;

        if (uiModel.navigateTo == null) {
          uiModel = uiModel.copyWith(
            navigateTo: (detailId) {
              context.read<DetailBloc>().add(LoadDetails(detailId, pageType));
            },
          );
        }

        return DetailPageCore(uiModel: uiModel);
      case DetailStateEmpty:
        return EmptyPageWidget(
          text: 'Something went wrong)',
          reloadHandler: () {
            final empty = state as DetailStateEmpty;
            if (empty.id != null && empty.type != null) {
              context
                  .read<DetailBloc>()
                  .add(LoadDetails(empty.id!, empty.type!));
            }
            // LoadDetails
          },
        );
      default:
        return const EmptyPageWidget(text: 'Something went wrong)');
    }
  }
}
