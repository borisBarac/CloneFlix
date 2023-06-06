import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// State is holding the current index
class TabChangeCubit extends Cubit<int> {
  ///
  TabChangeCubit({
    int currentTabIndex = 0,
    required this.numberOfTabs,
    this.tabClicks = const [],
  })  : assert(
          numberOfTabs == tabClicks.length,
          'numberOfTabs is not the same like tabClicks array',
        ),
        super(currentTabIndex);

  ///
  int numberOfTabs;

  ///
  List<VoidCallback> tabClicks;

  /// go to specific tab
  void changeIndex(int index) {
    if (_indexCheck(index)) {
      emit(index);
    }
  }

  /// change tab, and activate callback
  void tabClick(int index) {
    // if nothing changed, we do not do anything,
    //maybe we could jump to root of the tab in this case
    if (state == index) {
      return;
    }
    if (_indexCheck(index)) {
      changeIndex(index);
      tabClicks[index]();
    }
  }

  bool _indexCheck(int index) => -1 < index && index < numberOfTabs;
}
