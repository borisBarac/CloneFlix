import 'package:flutter/material.dart';
import 'package:shared/src/ui/doubled_list/list_row.dart';

/// Do not export
abstract class DoubledListBase<Model> extends StatelessWidget {
  /// Default constructor
  /// Add pageKeyPrefix if you want to remember the position of sub lists
  const DoubledListBase({
    super.key,
    this.pageKeyPrefix,
    required this.uiModel,
    required this.listRowBuilder,
    this.aspectRatio = 1,
    this.rowWidth = 120,
  });

  /// used for page buckets
  final String? pageKeyPrefix;

  /// block to build items in sub list
  final Widget Function(BuildContext context, Model model) listRowBuilder;

  /// nodoc
  final double aspectRatio;

  /// nodoc
  final double rowWidth;

  /// UI model based on nested list
  final List<List<Model>> uiModel;

  ///
  Widget makePrimaryListBody(
    BuildContext context,
    int primaryIndex, {
    double rowHeight = 250,
    Key? subListKey,
  }) {
    final rowCount = uiModel[primaryIndex].length;
    final visibleIndex = primaryIndex + 1;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              'Collection: $visibleIndex',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        SizedBox(
          height: rowHeight,
          child: ListRow(
            key: subListKey,
            itemCount: rowCount,
            listBuilder: (context, index) {
              return listRowBuilder(context, uiModel[primaryIndex][index]);
            },
          ),
        ),
      ],
    );
  }
}

List<List<int>> get fakeDoubledListIntModel {
  const numRows = 20;
  const numCols = 10;

  // ignore: omit_local_variable_types, prefer_final_locals
  List<List<int>> bigList = [];

  for (var i = 0; i < numRows; i++) {
    final row = <int>[];
    for (var j = 0; j < numCols; j++) {
      row.add(i * numCols + j);
    }
    bigList.add(row);
  }

  return bigList;
}
