part of home_page;

///
extension HomePageStateBuilder on HomePage {
  Widget _buildWidgetWithState<BlockType extends Bloc<DataEvent, DataState>>(
    BuildContext context,
    DataState state,
    int tab,
  ) {
    switch (state.runtimeType) {
      case DataStateLoading:
        return const LoadingIndicator(0.25);
      case DataStateFull:
        return buildWidgetForFullState<BlockType>(
          context,
          state as DataStateFull,
          tab,
        );
      default:
        return EmptyPageWidget(
          text: 'Something went wrong)',
          reloadHandler: () {
            // we are using 2 loading blocks, one for tabs, one for movies

            tab == 0
                ? context.read<MovieLoadBlock>().add(const LoadAll())
                : context
                    .read<TvShowLoadBlock>()
                    .add(const LoadAll(type: LoadType.tv));
          },
        );
    }
  }
}

/// context can be null so that we can use this in unit tests
/// and not widget tests
@visibleForTesting
Widget buildWidgetForFullState<BlockType extends Bloc<DataEvent, DataState>>(
  BuildContext? context,
  DataStateFull state,
  int tab,
) {
  return HeroBuilder.buildWithModel(
    makeHeroModelFrom<BlockType>(
      context,
      state,
      tab,
    ),
    context,
  );
}

/// context can be null so that we can use this in unit tests
/// and not widget tests
@visibleForTesting
HeroListUIModel<ListItemUIModel>
    makeHeroModelFrom<BlockType extends Bloc<DataEvent, DataState>>(
  BuildContext? context,
  DataStateFull state,
  int tab,
) {
  ;
  final doubledListModel = _splitInToChunks<ListItemUIModel>(
    state.data,
    size: (state.data.length / 10).round(),
  );

  return HeroListUIModel<ListItemUIModel>(
    key: _makeTabKeyFromTitle(_titles[tab]),
    pageKeyPrefix: _makeStringKeyFromTitle(_titles[tab]),
    appBarImagePath: _appBarImages[tab],
    appBarTitle: _titles[tab],
    heroHeight: context != null ? _heroHeight(context) : 180,
    onRefresh: () async {
      final action = tab == 0
          ? const LoadAll(isPullToRefresh: true)
          : const LoadAll(type: LoadType.tv, isPullToRefresh: true);
      return Future(() => context?.read<BlockType>().add(action));
    },
    doubledListModel: doubledListModel,
    rowBuilder: (context, model) {
      return ListItem.withModel(model);
    },
  );
}

List<List<T>> _splitInToChunks<T>(List<T> list, {int size = 10}) {
  final len = list.length;
  final chunks = List<List<T>>.empty(growable: true);

  for (var i = 0; i < len; i += size) {
    final end = (i + size < len) ? i + size : len;
    chunks.add(list.sublist(i, end));
  }

  return chunks;
}
