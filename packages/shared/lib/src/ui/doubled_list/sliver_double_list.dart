part of doubled_list;

/// Same as DoubledList but this one is to be used in the Sliver geometry
class DoubledSliverList<Model> extends DoubledListBase<Model> {
  /// Default constructor
  /// Add pageKeyPrefix if you want to remember the position of sub lists
  const DoubledSliverList({
    super.key,
    super.pageKeyPrefix,
    required super.uiModel,
    required super.listRowBuilder,
    super.aspectRatio = 1.667,
    super.rowWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    return _makePrimaryList();
  }

  Widget _makePrimaryList() {
    final key = (pageKeyPrefix?.isNotEmpty ?? false)
        ? PageStorageKey('$pageKeyPrefix-MainList')
        : null;

    return SliverList(
      key: key,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return makePrimaryListBody(
            context,
            index,
            rowHeight: rowWidth * aspectRatio,
            subListKey: PageStorageKey('$pageKeyPrefix-SubList$index'),
          );
        },
        childCount: uiModel.length,
      ),
    );
  }
}

DoubledSliverList<int> fakeDoubledSliverList() {
  return DoubledSliverList<int>(
    uiModel: fakeDoubledListIntModel,
    listRowBuilder: (context, model) =>
        const SizedBox(width: 120, child: FakeItem()),
  );
}
