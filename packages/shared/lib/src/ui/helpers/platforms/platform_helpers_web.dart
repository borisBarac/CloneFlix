// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

bool checkUserAgentForTouch() {
  final substrings = ['iphone', 'ipod', 'ipad', 'android', 'iemobile'];
  final userAgent = window.navigator.userAgent.toLowerCase();
  return substrings
      .firstWhere(
        (element) => userAgent.toLowerCase().contains(element),
        orElse: () => '',
      )
      .isNotEmpty;
}
