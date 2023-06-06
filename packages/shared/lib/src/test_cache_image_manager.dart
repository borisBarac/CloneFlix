// ignore_for_file: depend_on_referenced_packages

import 'package:file/local.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

/// used in tests to mock the images
class MockCacheManager extends Mock implements DefaultCacheManager {
  static const _fileSystem = LocalFileSystem();

  @override
  Stream<FileResponse> getImageFile(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
    int? maxHeight,
    int? maxWidth,
  }) async* {
    yield FileInfo(
      _fileSystem.file(
        'packages/shared/assets/movie_hero.jpg',
      ), // Return your image file path
      FileSource.Cache,
      DateTime(2050),
      url,
    );
  }
}

/// used to mock all images in tests
DefaultCacheManager getCacheManager() =>
    GetIt.I.isRegistered<DefaultCacheManager>()
        ? MockCacheManager()
        : DefaultCacheManager();
