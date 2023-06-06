// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shared/shared.dart';
import 'package:shared/shared_helpers.dart';
import 'package:shared/src/ui/orientation_locking.dart';

void main() {
  group('SharedUi', () {
    testWidgets('DoubledList can render', (widgetTester) async {
      await widgetTester.pumpWidget(_embedInAppWithScaffold(fakeDoubledList()));
      final widget = find.byType(DoubledList<int>);

      expect(widget, findsOneWidget);
    });

    testWidgets('DoubledSliverList can render', (widgetTester) async {
      final pumpWidget = CustomScrollView(
        slivers: [fakeDoubledSliverList()],
      );

      await widgetTester.pumpWidget(_embedInAppWithScaffold(pumpWidget));
      final widget = find.byType(DoubledSliverList<int>);

      expect(widget, findsOneWidget);
    });

    testWidgets('HeroList can render', (widgetTester) async {
      await widgetTester.pumpWidget(
        _embedInAppWithScaffold(fakeHeroList()),
      );
      final widget = find.byType(HeroList);

      expect(widget, findsOneWidget);
    });

    testWidgets('HeroList call end scroll block', (widgetTester) async {
      final completer = Completer<void>();

      final heroList = HeroList(
        onRefresh: _fakeRefresh,
        flexibleSpaceBar: FlexibleSpaceBar(
          title: Text(
            'SliverAppBar',
          ),
          background: FlutterLogo(),
        ),
        doubledList: fakeDoubledSliverList(),
        onScrollEndAction: completer.complete,
      );

      await widgetTester.pumpWidget(
        _embedInAppWithScaffold(heroList),
      );
      await widgetTester.pumpAndSettle();

      await widgetTester.drag(
        find.byType(CustomScrollView),
        const Offset(0, -12000000000),
      );
      await widgetTester.pumpAndSettle();

      expect(completer.isCompleted, isTrue);
    });

    testWidgets('HeroList be build from UI Model', (widgetTester) async {
      final uiModel = HeroListUIModel(
        appBarImagePath: movieHeroImageAsset,
        appBarTitle: '',
        onRefresh: _fakeRefresh,
        doubledListModel: _fakeDoubledListIntModel,
        rowBuilder: (context, model) => Text(model.toString()),
      );

      final child = HeroBuilder.buildWithModel(uiModel, null);
      expect(child, isNotNull);
      final app = MaterialApp(home: child);

      await mockNetworkImagesFor(() => widgetTester.pumpWidget(app));

      final widget = find.byType(HeroList);
      expect(widget, findsOneWidget);
    });

    testWidgets('Orientation lock works', (widgetTester) async {
      final widget = OrientationLock(Text('2112'), landscape: true);
      // ignore: inference_failure_on_collection_literal
      final logs = [];

      widgetTester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform, (methodCall) async {
        if (methodCall.method == 'SystemChrome.setPreferredOrientations') {
          logs.add((methodCall.arguments as List)[0]);
        }
        return null;
      });

      expect(logs.length, 0);

      await widgetTester.pumpWidget(_embedInAppWithScaffold(widget));

      expect(
        logs.length,
        1,
        reason: 'It should have pushed a log after the initState',
      );
      expect(
        logs.first,
        'DeviceOrientation.landscapeLeft',
        reason: 'It should be in the landscape view after the initState',
      );

      await widgetTester.pumpWidget(const SizedBox()); // Disposes the widget
      expect(
        logs.length,
        2,
        reason: 'It should have added a log after the dispose',
      );
      expect(
        logs.last,
        'DeviceOrientation.portraitUp',
        reason: 'It should be in the landscape view after the dispose',
      );
    });
  });
}

Widget _embedInAppWithScaffold(Widget child) => MaterialApp(
      home: Scaffold(body: child),
    );

RefreshCallback get _fakeRefresh => () {
      return Future<void>.delayed(const Duration(seconds: 3));
    };

List<List<ListItemUIModel>> get _fakeDoubledListIntModel {
  const numRows = 20;
  const numCols = 10;

  // ignore: omit_local_variable_types, prefer_final_locals
  List<List<ListItemUIModel>> bigList = [];

  for (var i = 0; i < numRows; i++) {
    final row = <ListItemUIModel>[];
    for (var j = 0; j < numCols; j++) {
      final str = 'row:$i col:$j';
      row.add(
        ListItemUIModel(click: null, posterUrl: str, title: str, id: i * j),
      );
    }
    bigList.add(row);
  }

  return bigList;
}
