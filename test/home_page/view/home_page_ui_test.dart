import 'dart:async';
import 'dart:developer';

import 'package:bloc_test/bloc_test.dart';
import 'package:clone_flix/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/src/repository/home_page_network_loadable.dart';

import '../../helpers/helpers.dart';

class MockTabChangeCubit extends MockCubit<int> implements TabChangeCubit {}

void main() {
  group('HomePage', () {
    setUpAll(registerTestDependencies);

    tearDownAll(() => GetIt.I.reset());

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpApp(
        HomePage(
          cubit: TabChangeCubit(numberOfTabs: 2, tabClicks: [() {}, () {}]),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('remembers the position of scroll when changing tabs',
        (tester) async {
      throw UnimplementedError(
        'Need to refactor the app to support full network mocks',
      );

      // GetIt.I.registerLazySingleton<HomePageNetworkLoadable>(
      //   MockedHomePageNetworkLoadable.new,
      // );

      // await runZonedGuarded(
      //   () => tester.pumpWidget(const App()),
      //   (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
      // );
      // await tester.pumpAndSettle();

      // final tab1 = find.text('Movies');
      // final tab2 = find.text('TV Shows');
      // expect(tab1, findsOneWidget);
      // expect(tab2, findsOneWidget);

      // await tester.drag(
      //   find.byType(CustomScrollView),
      //   const Offset(0, -1200),
      // );
      // await tester.pumpAndSettle();

      // var scroll = find.byType(FlexibleSpaceBar);
      // expect(scroll, findsOneWidget);

      // final size1 = tester.getSize(scroll);

      // // use pumpAndSettle because we have animations

      // await tester.tap(tab2);
      // await tester.pumpAndSettle();

      // await tester.tap(tab1);
      // await tester.pumpAndSettle();

      // scroll = find.byType(FlexibleSpaceBar);
      // expect(scroll, findsOneWidget);

      // final size2 = tester.getSize(scroll);

      // expect(size1 == size2, true);
    });
  });
}
