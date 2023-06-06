import 'dart:async';

import 'package:caching_service/caching_service.dart';
import 'package:caching_service/src/cached_object.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

/// We gonna use this to cache out network calls
@visibleForTesting
class CachingServiceImplementation implements CachingService {
  /// constructor
  @visibleForTesting
  CachingServiceImplementation(this._serviceConfiguration) {
    db = _openDB();
  }

  final ServiceConfiguration _serviceConfiguration;

  @override
  ServiceConfiguration get serviceConfiguration => _serviceConfiguration;

  /// this is a Future because we want to be sure DB has been resolved
  @visibleForTesting
  late Future<Isar> db;

  @override
  Future<int> save(String key, String? encodedObject) async {
    final isar = await db;
    final object = CachedObject(
      key,
      DateTime.now(),
      encodedObject ?? '',
    );

    return isar.writeTxn(() => isar.cachedObjects.put(object));
  }

  @override
  Future<String?> get(String key) async {
    final isar = await db;
    final deadline = _objectLifeDeadLine().add(const Duration(minutes: 2));
    return isar.cachedObjects
        .filter()
        .keyEqualTo(key, caseSensitive: false)
        .sortByCreationTimeDesc()
        .findFirst()
        .then(
          (value) =>
              (value?.creationTime.isAfter(deadline) ?? false) ? value : null,
        )
        .then((value) => value?.cachedObject);
  }

  @visibleForTesting
  // ignore: public_member_api_docs
  /// exposed because of tests
  Future<void> deleteOld() async {
    final isar = await db;
    await isar.writeTxn(() async {
      final _ = await isar.cachedObjects
          .filter()
          .creationTimeLessThan(_objectLifeDeadLine())
          .deleteAll();
    });
  }

  Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [CachedObjectSchema],
        inspector: _serviceConfiguration.enableInspector,
      );
    }

    return Future.value(Isar.getInstance());
  }

  DateTime _objectLifeDeadLine() {
    return DateTime.now()
        .subtract(Duration(hours: serviceConfiguration.expiryTime));
  }
}
