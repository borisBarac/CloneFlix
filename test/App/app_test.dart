// ignore_for_file: omit_local_variable_types

import 'package:clone_flix/app/app.dart';
import 'package:clone_flix/bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  group('App', () {
    testWidgets('can set up the shred config', (WidgetTester tester) async {
      await bootstrap(() => const App());
      await tester.pumpAndSettle();
      final config = GetIt.I.get<Map<String, String>>(instanceName: 'config');

      expect(config['domain'], isNotNull);
      expect(config['subdomain'], isNotNull);
      expect(config['apiVersion'], isNotNull);
      expect(config['apiKey'], isNotNull);
    });
  });
}
