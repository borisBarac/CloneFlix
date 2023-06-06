library routes;

import 'dart:io';

import 'package:clone_flix/app/routes/go_state_ext.dart';
import 'package:clone_flix/app/routes/route_keys.dart';
import 'package:clone_flix/app/routes/router_state.dart';
import 'package:clone_flix/app/view/video_page.dart';
import 'package:clone_flix/capabilities_and_policies/policies.dart';
import 'package:clone_flix/utility/static.dart';
import 'package:detail_page/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/home_page.dart';
import 'package:shared/shared.dart';
import 'package:sheet/route.dart';

part './routes_builder.dart';
part './transitions.dart';

class AppRouter {
  AppRouter(this.state);
  final RouterState state;

  late final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: state,
    errorBuilder: (context, state) => PlatformScaffold(
      body: EmptyPageWidget(
        // this is gonna remake the app,and start the navigation from root
        // this could easily be extended to support state restoration,
        // both BLOCK and GoRouter can do it
        // on web it is also gonna save the location
        reloadHandler: () => this.state.reload(),
      ),
    ),
    routes: _makeRoutes(),
  );
}

///
// stupid hack to save the scroll
/// at the moment Routers are re making the screen
/// even when you are using the nested routes or shell routes
/// Support for persisting widgets should be added to GoRouter soon
/// BTW, wrapping the widget in the PageStorage does not work for some reason
/// it needs to be injected, and set up outside of the router
///
/// [PR](https://github.com/flutter/packages/pull/2650)
final buckets = [PageStorageBucket(), PageStorageBucket()];

List<RouteBase> _makeRoutes() {
  final policies = GetIt.I.get<Policies>();

  return <RouteBase>[
    GoRoute(
      name: 'root',
      path: '/',
      redirect: (context, state) =>
          namedPathFor(AppRoute.movies), // '/home/movies'
    ),
    GoRoute(
      name: 'home',
      path: namedPathFor(AppRoute.home), // '/home/:tab(movies|tv_shows)';
      pageBuilder: (context, state) {
        final key =
            state.pageKey.toString() + state.params[RouteKeys.tab].toString();
        final isLtR = state.params[RouteKeys.tab] == 'movies';

        // wanted to avoid having effects for large screed,
        // but because we have parallax there,
        //it actually looks better in some cases
        return _wrapInSlideOrFade(
          ValueKey(key),
          400,
          context,
          _buildHome(state, context),
          isLeftRoRight: isLtR,
          isFadeIn: !policies.shouldHaveTabChangeEffect(context),
        );
      },
      routes: [
        GoRoute(
          name: 'details',
          path: namedPathFor(AppRoute.detail), // 'details/:id';
          pageBuilder: (context, state) {
            // this is used mostly because i want to see how parameters work
            final isMobile = state.queryIsMobile;
            final id = state.params[RouteKeys.id]!;
            final type = state.params[RouteKeys.tab] == 'tv_shows'
                ? DetailsType.tv
                : DetailsType.movie;
            final child = createDetailPage(
              id: int.parse(id),
              type: type,
              mockNetwork: false,
              playVideoOf: (videoId) {
                final route = AppRouteBuilder(
                  AppRoute.video,
                  currentLocation: state.path ?? '',
                ).buildFullPath();

                if (route?.isNotEmpty ?? false) context.push(route!);
              },
            );

            return isMobile
                ? _embedInSheet(context, state: state, child: child)
                : _embedInTransparentOverlay(
                    context,
                    pageKey: state.pageKey,
                    state: state,
                    child: child,
                    hasFractionalBox: policies
                        .shouldOverlayHaveTransparentBackground(context),
                  );
          },
        ),
      ],
    ),
    GoRoute(
      name: 'video',
      path: namedPathFor(AppRoute.video), // '/video';
      builder: (context, state) => createVideoPage(mockVideoStream),
    ),
  ];
}

Widget _buildHome(GoRouterState state, BuildContext context) {
  final location =
      GoRouter.of(context).routeInformationProvider.value.location ?? '';

  return HomePage.makeForMoviesAndTvShows(
    initialTabIndex: state.params['tab'] == 'tv_shows' ? 1 : 0,
    movieTabClick: () => _tabClick(location, AppRoute.movies, context),
    tvTabClick: () => _tabClick(location, AppRoute.tvShows, context),
    openDetails: (itemId) {
      // ignore: avoid_bool_literals_in_conditional_expressions
      final isMobile = kIsWeb ? false : Platform.isAndroid || Platform.isIOS;

      // NOTE TO SELF:
      // this would be cool to return some result from a child route
      // we use it for mobile flag here because i want to test how they work

      // https://github.com/csells/go_router/issues/170
      // So when i go back to home, my current route is: /home/movies/?isMobile=true
      // Anyway, it is duplication the query section
      // for every route when you print the location
      // so more stupid go router problems

      final splits = GoRouter.of(context)
          .routeInformationProvider
          .value
          .location
          ?.split('/?');
      final currentPath = splits?.isNotEmpty ?? false ? splits![0] : '';

      final path = AppRouteBuilder(
        AppRoute.detail,
        currentLocation: currentPath,
        params: {RouteKeys.id: '$itemId'},
        queryParams: {RouteKeys.isMobile: isMobile.toString()},
      ).buildFullPath();
      assert(path != null, 'path error');

      // redirect to default error page
      context.go(path ?? 'error');
    },
    // see bucket definition, for explanation why we need to inject this
    pageStorageBucket: buckets[state.params['tab'] == 'tv_shows' ? 1 : 0],
  );
}

void _tabClick(String currentLocation, AppRoute route, BuildContext context) =>
    context.go(
      AppRouteBuilder(
            route,
            currentLocation: currentLocation,
          ).buildFullPath() ??
          '',
    );
