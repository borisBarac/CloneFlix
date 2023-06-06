// ignore_for_file: prefer_const_constructors

import 'package:caching_service/caching_service.dart';
import 'package:caching_service/src/caching_service_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:caching_service/src/cached_object.dart';

void main() {
  final serviceConfiguration = ServiceConfiguration();

  /// For testing purposes i am going to use a normal string
  /// instead of a encoded string
  group('CachingService', () {
    late CachingServiceImplementation service;

    setUpAll(() async {
      await Isar.initializeIsarCore(download: true);
      service = CachingServiceImplementation(serviceConfiguration);
      final isar = await service.db;
      isar.writeTxnSync(() => isar.cachedObjects.clearSync());
    });

    test('can be instantiated', () async {
      final db = await service.db;
      expect(service, isNotNull);
      expect(db, isNotNull);
    });

    test('can save a string', () async {
      final _ = await service.save('testKey1', 'FAKE_ENCODED_OBJECT');
      final isar = await service.db;
      final count = isar.cachedObjects.countSync();
      expect(count, greaterThan(0));
    });

    test('can get a object', () async {
      const key = 'testKey-object-get';
      const str = 'FAKE_ENCODED_OBJECT_918830912908302';

      final _ = await service.save(key, str);
      final strForKey = await service.get(key);

      expect(strForKey, equals(str));
    });

    test('it can delete old objects', () async {
      final isar = await service.db;
      // ignore: constant_identifier_names
      const old_key = 'delete_old';
      final creationTime = DateTime.now()
          .subtract(Duration(hours: serviceConfiguration.expiryTime + 1));
      final object = CachedObject(
        old_key,
        creationTime,
        'fake_encoded_object',
      );

      await isar.writeTxn(() => isar.cachedObjects.put(object));
      await service.deleteOld();
      final old = await service.get(old_key);

      expect(old, isNull);
    });

    tearDownAll(() async {
      final isar = await service.db;
      isar.writeTxnSync(() => isar.cachedObjects.clearSync());
    });
  });
}
