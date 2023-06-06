// ignore_for_file: require_trailing_commas

library home_page;

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/src/repository/home_repository.dart';
import 'package:shared/shared.dart';
import 'package:shared/shared_helpers.dart';
part 'home_page_state_builder.dart';

/// Block type
typedef HomePageDetailsCallback = void Function(int);

final _titles = ['Movies', 'TV Shows'];
final _icons = [Icons.movie, Icons.live_tv];
final _appBarImages = [
  movieHeroImageAsset,
  tvHeroImageAsset,
];

/// HomePage that is gonna be used in the main app
class HomePage extends StatelessWidget {
  /// used in tests
  @visibleForTesting
  HomePage({
    TabChangeCubit? cubit,
    super.key,
  }) {
    _cubit = cubit;
    _pageBucket = PageStorageBucket();
    GetIt.I.registerLazySingleton<HomePageNetworkLoadable>(
        MockedHomePageNetworkLoadable.new);
    GetIt.I.registerLazySingleton(HomePageUIMapper.new);
  }

  /// Constructor that should be used in router setup
  /// Movies are on idex 0, tv on index 1
  ///
  // stupid hack to save the scroll
  /// at the moment Routers are re making the screen
  /// even when you are using the nested routes or shell routes
  /// Support for persisting widgets should be added to GoRouter soon
  /// [PR](https://github.com/flutter/packages/pull/2650)
  HomePage.makeForMoviesAndTvShows({
    int initialTabIndex = 0,
    required VoidCallback movieTabClick,
    required VoidCallback tvTabClick,
    HomePageDetailsCallback? openDetails,
    PageStorageBucket? pageStorageBucket,
    super.key,
  }) {
    _pageBucket = pageStorageBucket ?? PageStorageBucket();
    _cubit = TabChangeCubit(
      currentTabIndex: initialTabIndex,
      numberOfTabs: _titles.length,
      tabClicks: [movieTabClick, tvTabClick],
    );
    if (GetIt.I.isRegistered<HomePageNetworkLoadable>() == false) {
      GetIt.I.registerLazySingleton<HomePageNetworkLoadable>(
          HomeRepository.initWithGetIt);
    }

    if (GetIt.I.isRegistered<HomePageUIMapper>() == false) {
      GetIt.I.registerLazySingleton(
        () => HomePageUIMapper(detailClickBlock: openDetails),
      );
    }
  }

  late final TabChangeCubit? _cubit;
  late final PageStorageBucket _pageBucket;

  // ignore: public_member_api_docs
  @override
  Widget build(BuildContext context) {
    // we register 2 providers for data, so that we do not have to care
    // about syncing data loading with tab switching
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _cubit ?? TabChangeCubit(numberOfTabs: 0),
        ),
        BlocProvider<MovieLoadBlock>(
          create: (context) => DataLoadBloc(
            GetIt.I.get<HomePageNetworkLoadable>(),
            GetIt.I.get<HomePageUIMapper>(),
          )..add(const LoadAll()),
        ),
        BlocProvider<TvShowLoadBlock>(
          create: (context) => DataLoadBloc(
            GetIt.I.get<HomePageNetworkLoadable>(),
            GetIt.I.get<HomePageUIMapper>(),
          )..add(const LoadAll(type: LoadType.tv)),
        ),
      ],
      child: Builder(
        builder: _buildView,
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    assert(_titles.length == _icons.length, 'Wrong set up');
    final destinations = _makeNavigationItems(context);

    // def to 0
    final currentTab = context.select((TabChangeCubit cubit) => cubit.state);

    // this is new official package by flutter team
    return AdaptiveScaffold(
      internalAnimations: false,
      selectedIndex: currentTab,
      onSelectedIndexChange: (index) =>
          context.read<TabChangeCubit>().tabClick(index),
      smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
      useDrawer: false,
      destinations: destinations,
      body: (_) => PageStorage(
        bucket: _pageBucket,
        child: _makeContextFor(currentTab, context),
      ),
    );
  }

  List<NavigationDestination> _makeNavigationItems(BuildContext context) {
    assert(_titles.length == _icons.length, 'Wrong set up');
    return [0, 1]
        .map(
          (index) => NavigationDestination(
            icon: Icon(_icons[index]),
            label: _titles[index],
          ),
        )
        .toList();
  }

  Widget _makeContextFor(int tabIndex, BuildContext context) {
    return IndexedStack(
      index: tabIndex,
      children: [
        BlocConsumer<MovieLoadBlock, DataState>(
          listener: (context, state) {},
          builder: (context, state) => _buildWidgetWithState<MovieLoadBlock>(
            context,
            state,
            tabIndex,
          ),
        ),
        BlocConsumer<TvShowLoadBlock, DataState>(
          listener: (context, state) {},
          builder: (context, state) => _buildWidgetWithState<TvShowLoadBlock>(
            context,
            state,
            tabIndex,
          ),
        ),
      ],
    );
  }
}

double _heroHeight(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // ignore: omit_local_variable_types
  const double baseHeightTabPhone = 200;
  // ignore: omit_local_variable_types
  if (size.width > 1000) {
    return size.height * 0.43;
  } else if (size.width > 700) {
    return baseHeightTabPhone * 1.55;
  } else {
    return baseHeightTabPhone;
  }
}

PageStorageKey<String> _makeTabKeyFromTitle(String key) => PageStorageKey(
      _makeStringKeyFromTitle(key),
    );

String _makeStringKeyFromTitle(String key) => 'HomePage${key}TabKey';

RefreshCallback get _fakeRefresh => () {
      return Future<void>.delayed(const Duration(seconds: 3));
    };

const _fakeFlexibleSpaceBar = FlexibleSpaceBar(
  title: Text(
    'SliverAppBar',
    textAlign: TextAlign.left,
  ),
  background: FlutterLogo(),
);
