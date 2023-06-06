// ignore_for_file: prefer_const_constructors,
import 'package:detail_page/detail_page.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page.dart';
import 'package:detail_page/src/ui/detail_page_core.dart';
import 'package:detail_page/src/ui/detail_page_ui_model.dart';
import 'package:detail_page/src/ui/detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DetailPageModel dpModel;

  setUpAll(() async => dpModel = await createMockedDetailPageModel());

  group('DetailPage', () {
    testWidgets('RelatedRow can render', (widgetTester) async {
      await _testWidgetCanRender(
        RelatedRow(dpModel.detailsRowModels[0], 0, DetailsType.movie),
        widgetTester,
        find,
      );
    });

    testWidgets('DetailText can render', (widgetTester) async {
      const text = 'hello';
      await _testWidgetCanRender(DetailText(text), widgetTester, find);
      expect(find.text(text), findsOneWidget);
    });
  });

  group('DetailCore', () {
    testWidgets('DetailPageCore can render', (widgetTester) async {
      expect(dpModel, isNotNull);
      final dp = DetailPageCore(uiModel: dpModel);

      await widgetTester.pumpWidget(_embedInApp(dp));
      final widget = find.byType(DetailPageCore);
      expect(widget, findsOneWidget);
    });
  });
}

Future<void> _testWidgetCanRender<T extends Widget>(
  T testedWidget,
  WidgetTester widgetTester,
  CommonFinders find,
) async {
  await widgetTester.pumpWidget(_embedInApp(testedWidget));
  final widget = find.byType(T);
  expect(widget, findsOneWidget);
}

Widget _embedInApp(Widget child) => MaterialApp(
      home: Scaffold(body: child),
    );
