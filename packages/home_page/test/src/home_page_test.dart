// ignore_for_file: prefer_const_constructors, require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_page/home_page.dart';
import 'package:shared/shared.dart';

void main() async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.I.reset();
  });

  Future<void> pumpHomePageInApp(WidgetTester widgetTester) async {
    binding.window.physicalSizeTestValue = Size(390, 844);
    binding.window.devicePixelRatioTestValue = 1.0;

    return widgetTester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
  }

  group('HomePage', () {
    test('can be instantiated', () {
      expect(HomePage(), isNotNull);
    });

    testWidgets('can render widget', (widgetTester) async {
      await pumpHomePageInApp(widgetTester);
      find.byType(HomePage);
    });

    test('can make HeroModel from dataState', () {
      final items = List<ListItemUIModel>.empty(growable: true);
      for (var i = 0; i < 10; i++) {
        items.add(
          ListItemUIModel(posterUrl: 'fake', title: 'fake', id: i, click: null),
        );
      }
      final state = DataStateFull(data: items);
      expect(
        () => makeHeroModelFrom<MovieLoadBlock>(null, state, 0),
        returnsNormally,
      );
    });

    test('can make Hero from model', () {
      final items = List<ListItemUIModel>.empty(growable: true);
      for (var i = 0; i < 10; i++) {
        items.add(
          ListItemUIModel(posterUrl: 'fake', title: 'fake', id: i, click: null),
        );
      }
      final state = DataStateFull(data: items);
      expect(
        () => buildWidgetForFullState<MovieLoadBlock>(null, state, 0),
        returnsNormally,
      );
    });
  });
}
