import 'dart:convert';
import 'dart:io';

/// we need this because of flutter test bug
/// https://github.com/flutter/flutter/issues/20907
String fixtureFileAsString(String file) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/fixtures/$file').readAsStringSync();
}

/// This provides a json object for file, and it does it a SYNC way,
///  so it is great for tests
///
/// Usage:
/// ```
/// final json = jsonFromFixture('movie_details.json');
/// ```
dynamic jsonFromFixture(String filename) =>
    jsonDecode(fixtureFileAsString(filename));
