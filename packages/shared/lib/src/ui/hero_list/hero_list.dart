library hero_list;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared/shared.dart';

part './hero_list_ui_model.dart';
part './hero_fakes.dart';

/// Hero list view
class HeroList extends StatefulWidget {
  /// default constructor
  /// expandedHeight defaults to 160
  HeroList({
    super.key,
    this.heroHeight = 160,
    this.pageKeyPrefix,
    this.initialScrollOffset = 0,
    required this.flexibleSpaceBar,
    required this.doubledList,
    required this.onRefresh,
    this.onScrollEndAction,
  }) : scrollController =
            ScrollController(initialScrollOffset: initialScrollOffset);

  /// refresh block
  final RefreshCallback onRefresh;

  /// height of the hero cell
  final double heroHeight;

  /// SubList prefix key
  final String? pageKeyPrefix;

  ///
  final double initialScrollOffset;

  /// this gets injected in the scrollable app bar
  final FlexibleSpaceBar flexibleSpaceBar;

  /// scroll list bellow the appBar
  final DoubledSliverList<dynamic> doubledList;

  /// this block is gonna get called when we get to end of the page
  /// idea is mostly to use this for pagination support
  final VoidCallback? onScrollEndAction;

  /// Main scroll controller of the hero cell
  final ScrollController scrollController;

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  bool get _pinned => true;
  bool get _snap => false;
  bool get _floating => false;
  DateTime _onScrollEndActionLastCallTime =
      DateTime.now().subtract(const Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onScroll = widget.onScrollEndAction;
    widget.scrollController.addListener(() {
      final callOnScroll =
          DateTime.now().difference(_onScrollEndActionLastCallTime).inSeconds >
              3;

      final scroll = widget.scrollController;
      final nextPageTrigger = 0.865 * scroll.position.maxScrollExtent;
      if (scroll.position.pixels > nextPageTrigger &&
          onScroll != null &&
          callOnScroll) {
        _onScrollEndActionLastCallTime = DateTime.now();
        onScroll();
      }
    });

    // Alternative approach is to just put a CupertinoSliverRefreshControl
    // in the CustomScrollView between SliverAppBar and SliverList
    // Look customization are gonna need subclass-ing
    return PlatformScaffold(
      body: RefreshIndicator(
        edgeOffset: widget.heroHeight * 1.2,
        // onRefresh: () async {
        //   return Future<void>.delayed(const Duration(seconds: 3));
        // },
        onRefresh: widget.onRefresh,
        child: _buildCustomScroll(),
      ),
    );
  }

  /// Physics can be changed using [AlwaysScrollableScrollPhysics](https://api.flutter.dev/flutter/widgets/AlwaysScrollableScrollPhysics-class.html)
  /// <br> I noticed the performance is the best when left to default
  /// <br> Refresh implemented based on [flutter issue](https://github.com/flutter/flutter/issues/54272#issuecomment-1154534392)
  Widget _buildCustomScroll() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          stretch: true,
          expandedHeight: widget.heroHeight,
          flexibleSpace: widget.flexibleSpaceBar,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: ColoredBox(
              color: Colors.orange.shade700,
              child: Row(
                children: const [
                  Spacer(),
                  Text('You are in offline mode'),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
        widget.doubledList,
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Using TMDB Api'),
            ),
          ),
        )
      ],
    );
  }
}
