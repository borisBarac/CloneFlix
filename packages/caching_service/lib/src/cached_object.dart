import 'package:isar/isar.dart';

part 'cached_object.g.dart';

/// Main object we gonna use to cash our endpoint
@Collection()
class CachedObject {
  /// Main constructor
  CachedObject(this.key, this.creationTime, this.cachedObject);

  /// isar ID
  Id id = Isar.autoIncrement;

  /// main key we use to sava and get the object
  @Index()
  late String key;

  /// Creation time in UNIX time
  @Index()
  late DateTime creationTime;

  /// Cached object
  late String? cachedObject;
}
