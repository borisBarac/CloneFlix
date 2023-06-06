// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:caching_service/src/caching_service_implementation.dart';
import 'package:flutter/foundation.dart';

/// Config used to start the service
class ServiceConfiguration {
  ///
  /// [expiryTime]expiry time for the cashed data in hours
  ///
  /// Max object size is 16mb
  ServiceConfiguration({
    this.expiryTime = 12,
    this.enableInspector = kDebugMode,
  });

  // ignore: public_member_api_docs
  final int expiryTime;
  // ignore: public_member_api_docs
  final bool enableInspector;
}

/// We gonna use this to cache out network calls
abstract class CachingService {
  ///
  /// [serviceConfiguration] config for the service
  factory CachingService.create({
    required ServiceConfiguration serviceConfiguration,
  }) =>
      CachingServiceImplementation(serviceConfiguration);

  // final ServiceConfiguration _serviceConfiguration;

  /// ServiceConfiguration getter
  ServiceConfiguration get serviceConfiguration;

  /// Used to save object
  /// If object with same key is in DB, old one is gonna get deleted
  Future<int> save(String key, String? encodedObject);

  /// Used to save object
  /// If object with same key is in DB, old one is gonna get deleted
  Future<String?> get(String key);
}
