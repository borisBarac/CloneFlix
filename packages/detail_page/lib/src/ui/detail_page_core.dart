import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:detail_page/src/ui/detail_text.dart';
import 'package:detail_page/src/ui/shared_consts.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/shared_helpers.dart';

/// Core widget used to make screen specific layouts
/// Example: we gonna embed this widget in liner gradients for large screen UIs
class DetailPageCore extends StatelessWidget {
  /// nodoc
  const DetailPageCore({required this.uiModel, super.key});

  /// nodoc
  final DetailPageModel uiModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _makeHeader(context),
          _makeSubRows(context),
        ],
      ),
    );
  }

  Widget _makeHeader(BuildContext context) {
    return SizedBox(
      height: _calculateHeaderHeightFrom(context),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropImage(uiModel.backdropImageUrl),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black26,
                  Colors.black45
                ],
              ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, MediaQuery.of(context).size.width * 0.045, 0),
                        color: Colors.transparent,
                        child: _makePoster(
                          context,
                          uiModel.posterUrlSting,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 6,
                  child: _madeHeaderInfoPart(
                    uiModel.title,
                    uiModel.rating,
                    context,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makePoster(BuildContext context, String url) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ColoredBox(
        color: Colors.transparent,
        child: ListItem(imagePath: url),
      ),
    );
  }

  Widget _madeHeaderInfoPart(
    String title,
    double rating,
    BuildContext context,
  ) {
    final w = MediaQuery.of(context).size.width;
    final spacing = w * 0.0125;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: spacing),
        // ignore: prefer_const_constructors
        RatingLabel(rating),
        SizedBox(height: spacing),
        WatchButton(() {
          const fakeId = 22;
          uiModel.playVideoOf?.call(fakeId);
        }),
        SizedBox(height: spacing),
      ],
    );
  }

  Widget _makeSubRows(BuildContext context) {
    final listView = ListView.builder(
      shrinkWrap: true,
      itemCount: uiModel.detailsRowModels.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return DetailText(uiModel.description);
        } else {
          if (uiModel.detailsRowModels[index].isEmpty) {
            return const SizedBox.shrink();
          }

          // if row does not have specific click action,
          // we inject the default one
          final items = uiModel.getItemsForRow(index).map(
            (e) {
              if (e.click == null && uiModel.navigateTo != null) {
                return e.copyWithClick(uiModel.navigateTo!);
              } else {
                return e;
              }
            },
          ).toList();

          return RelatedRow(
            items,
            index,
            uiModel.type,
          );
        }
      },
    );

    final h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: h - _calculateHeaderHeightFrom(context),
      child: listView,
    );
  }
}

/// Used for related items (like related movies, or tv show seasons)
@visibleForTesting
class RelatedRow extends StatelessWidget {
  /// nodoc
  const RelatedRow(this.items, this.rowIndex, this.type, {super.key});

  /// nodoc
  final List<ListItemUIModel> items;

  /// nodoc
  final int rowIndex;

  /// nodoc
  final DetailsType type;

  @override
  Widget build(BuildContext context) {
    final visibleIndex = rowIndex + 1;
    final rowTitle = (type == DetailsType.movie)
        ? 'Related collection $visibleIndex'
        : 'Season $visibleIndex';
    return Container(
      padding: defaultEdges,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                rowTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: _calculateRelatedHeightFrom(context),
            child: ListRow(
              itemCount: items.length,
              listBuilder: (context, index) {
                return SizedBox(
                  width: _calculateRelatedHeightFrom(context) * (9 / 16),
                  child: ListItem.withModel(items[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

double _calculateHeaderHeightFrom(BuildContext context) {
  final h = MediaQuery.of(context).size.height;
  return h * 0.36;
}

double _calculateRelatedHeightFrom(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  switch (getTshirtSizeFor(context)) {
    case TshirtSize.S:
      return w * 0.4;
    case TshirtSize.M:
      return w * 0.35;
    case TshirtSize.L:
      return w * 0.15;
  }
}

/// Used in monarch
// ignore: prefer_const_constructors
Widget makeRelatedRowStory() => RelatedRow(
      const [
        ListItemUIModel(posterUrl: 'fake', title: '', id: 1, click: null),
        ListItemUIModel(posterUrl: 'fake', title: '', id: 1, click: null),
        ListItemUIModel(posterUrl: 'fake', title: '', id: 1, click: null),
        ListItemUIModel(posterUrl: 'fake', title: '', id: 1, click: null)
      ],
      3,
      DetailsType.movie,
    );
