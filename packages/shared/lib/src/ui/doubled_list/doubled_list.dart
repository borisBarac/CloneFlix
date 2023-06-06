library doubled_list;

import 'package:flutter/material.dart';
import 'package:shared/src/ui/doubled_list/doubled_list_base.dart';
import 'package:shared/src/ui/doubled_list/fake_item.dart';

part 'sliver_double_list.dart';

/// ListView with a listView in every cell
class DoubledList<Model> extends DoubledListBase<Model> {
  /// Default constructor
  const DoubledList({
    super.key,
    super.pageKeyPrefix,
    required super.uiModel,
    required super.listRowBuilder,
    super.aspectRatio = 1,
    super.rowWidth,
  });

  @override
  Widget build(BuildContext context) {
    return _makePrimaryList();
  }

  Widget _makePrimaryList() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: uiModel.length,
      itemBuilder: (context, index) => makePrimaryListBody(
        context,
        index,
        rowHeight: rowWidth * aspectRatio,
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

DoubledList<int> fakeDoubledList() {
  return DoubledList<int>(
    uiModel: fakeDoubledListIntModel,
    listRowBuilder: (context, model) =>
        const SizedBox(width: 120, child: FakeItem()),
  );
}
