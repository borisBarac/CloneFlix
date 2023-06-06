// ignore_for_file: public_member_api_docs

part of './hero_list.dart';

typedef NavigateToBlock = void Function(int detailId);

/// We use this model in Bloc to be able to create the widget from the model
/// That is why we need to provide all the data that we need to display
/// and control the UI
@immutable
class HeroListUIModel<RowItemModel> extends Equatable {
  const HeroListUIModel({
    this.key,
    required this.appBarImagePath,
    required this.appBarTitle,
    this.heroHeight = 160,
    this.initialScrollOffset = 0,
    this.pageKeyPrefix = '',
    this.onScrollEndAction,
    required this.onRefresh,
    required this.doubledListModel,
    required this.rowBuilder,
  });
  final List<List<RowItemModel>> doubledListModel;
  final Widget Function(BuildContext context, RowItemModel model) rowBuilder;
  final String appBarTitle;
  final AssetImage appBarImagePath;

  /// refresh block
  final RefreshCallback onRefresh;

  /// height of the hero cell
  final double heroHeight;

  /// SubList prefix key
  final String? pageKeyPrefix;
  final Key? key;
  final double initialScrollOffset;

  /// this block is gonna get called when we get to end of the page
  /// idea is mostly to use this for pagination support
  final VoidCallback? onScrollEndAction;

  @override
  List<Object?> get props => [
        doubledListModel.map((e) => e),
        appBarTitle,
        appBarImagePath,
      ];
}

/// it is a static function because extensions do not support constructors,
/// and i do not want this logic in the original file
/// and it feels even more stupid to put it the model
extension HeroBuilder on HeroList {
  static HeroList buildWithModel(
    HeroListUIModel<ListItemUIModel> uiModel,
    BuildContext? context,
  ) {
    const rowWidth = 125.0;
    final doubledList = DoubledSliverList(
      uiModel: uiModel.doubledListModel,
      rowWidth: rowWidth,
      listRowBuilder: (context, model) {
        return SizedBox(
          width: rowWidth,
          child: ListItem.withModel(model),
        );
      },
    );

    return HeroList(
      flexibleSpaceBar: _makeWithImageAndTitle(
        uiModel.appBarImagePath,
        uiModel.appBarTitle,
        context,
      ),
      doubledList: doubledList,
      heroHeight: uiModel.heroHeight,
      initialScrollOffset: uiModel.initialScrollOffset,
      key: uiModel.key,
      pageKeyPrefix: uiModel.pageKeyPrefix,
      onRefresh: uiModel.onRefresh,
    );
  }
}

FlexibleSpaceBar _makeWithImageAndTitle(
  AssetImage image,
  String title,
  BuildContext? context,
) {
  Widget backgroundWidget;
  try {
    backgroundWidget = Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    );
  } catch (_) {
    backgroundWidget = Container(color: Colors.red.shade50);
  }

  final Widget titleWidget = context != null
      ? Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        )
      : Text(title);

  return FlexibleSpaceBar(
    title: titleWidget,
    background: backgroundWidget,
    stretchModes: const [
      StretchMode.zoomBackground,
      StretchMode.blurBackground,
      StretchMode.fadeTitle
    ],
  );
}
