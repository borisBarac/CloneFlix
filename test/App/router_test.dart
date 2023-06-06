// ignore_for_file: omit_local_variable_types

import 'package:clone_flix/app/app.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/home_page.dart';
import 'package:shared/shared.dart';

import '../helpers/helpers.dart';

void main() {
  group('Router', () {
    setUpAll(registerTestDependencies);

    tearDownAll(() => GetIt.I.reset());

    test('has it been configured to correct paths', () {
      final appRouter = AppRouter(RouterState());
      final routeConfiguration = appRouter.goRouter.routeConfiguration;
      final routes =
          routeConfiguration.routes.map((e) => (e as GoRoute).path).toList();

      final homeSubRoutes = routeConfiguration.routes
          .firstWhere(
            (element) =>
                (element as GoRoute).path == namedPathFor(AppRoute.home),
          )
          .routes
          .map((e) => (e as GoRoute).path)
          .toList();

      expect(routes.isNotEmpty, isTrue);
      expect(routes, contains(namedPathFor(AppRoute.home)));

      expect(homeSubRoutes.isNotEmpty, isTrue);
      expect(homeSubRoutes, contains(namedPathFor(AppRoute.detail)));

      expect(routes, contains(namedPathFor(AppRoute.video)));
    });

    testWidgets('Can init the app, and go to home',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text('Movies'), findsOneWidget);
      expect(find.text('TV Shows'), findsOneWidget);
    });

    testWidgets('can go to custom error page', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      final testRouteInformation = <String, dynamic>{
        'location': '/error/12321kk',
      };
      final message = const JSONMethodCodec().encodeMethodCall(
        MethodCall('pushRouteInformation', testRouteInformation),
      );
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('flutter/navigation', message, (_) {});

      await tester.pumpAndSettle();

      expect(find.byType(EmptyPageWidget), findsOneWidget);
    });
  });
}
