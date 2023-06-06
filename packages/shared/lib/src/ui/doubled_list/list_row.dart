import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared/src/policies_capabilities/capabilities.dart';
import 'package:shared/src/ui/doubled_list/fake_item.dart';

/// Horizontal list view
/// <br> Used for movie rows
class ListRow extends StatefulWidget {
  ///
  const ListRow({
    super.key,
    required this.itemCount,
    required this.listBuilder,
  });

  /// nodoc
  ListRow.buildWithFakeItems({super.key})
      : itemCount = 50,
        listBuilder =
            ((context, index) => const SizedBox(width: 120, child: FakeItem()));

  /// do not forget po provide basic width here
  final IndexedWidgetBuilder listBuilder;

  /// nodoc
  final int itemCount;

  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  late int _itemsCount;
  int get _arrowJumpStem => (_itemsCount * 0.1).round();
  final _scrollDuration = const Duration(milliseconds: 20);

  CapabilitiesDefinition get capabilities =>
      GetIt.I.get<CapabilitiesDefinition>();

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }

    if (GetIt.I.isRegistered<CapabilitiesDefinition>() == false) {
      GetIt.I.registerSingleton<CapabilitiesDefinition>(
        CapabilitiesPackageDefaults(),
      );
    }
  }

  @override
  void didChangeDependencies() {
    _itemsCount = widget.itemCount;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Stack(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: _makeList(
                      context,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: capabilities.shouldHaveArrowsInHorizontalLists,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _makeArrowButton(context, _rightCLick, reversed: true),
                ),
              ),
              Visibility(
                visible: capabilities.shouldHaveArrowsInHorizontalLists,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _makeArrowButton(context, _leftCLick),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _makeList(
    BuildContext context, {
    Key? key,
  }) =>
      ScrollablePositionedList.builder(
        key: key,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: _itemsCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: widget.listBuilder,
      );

  void _leftCLick() {
    final first = itemPositionsListener.itemPositions.value.first.index;
    _jumpTo(first - _arrowJumpStem, true);
  }

  void _rightCLick() {
    final last = itemPositionsListener.itemPositions.value.last.index;
    _jumpTo(last + _arrowJumpStem, false);
  }

  void _jumpTo(int index, bool reversed) {
    final scrollTo = (index > -1 && index < _itemsCount)
        ? index
        : (reversed ? 0 : _itemsCount - 1);

    itemScrollController.scrollTo(
      index: scrollTo,
      duration: _scrollDuration,
      curve: Curves.easeIn,
    );
  }
}

Widget _makeArrowButton(
  BuildContext context,
  VoidCallback onPressed, {
  bool reversed = false,
}) {
  return Align(
    alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
    child: FractionallySizedBox(
      heightFactor: 1,
      widthFactor: 0.125,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: reversed ? Alignment.centerRight : Alignment.centerLeft,
            end: reversed ? Alignment.centerLeft : Alignment.centerRight,
            colors: const [
              Colors.black,
              Colors.black54,
              Colors.black38,
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: Icon(
              reversed ? Icons.arrow_right_outlined : Icons.arrow_left_outlined,
            ),
          ),
        ),
      ),
    ),
  );
}
