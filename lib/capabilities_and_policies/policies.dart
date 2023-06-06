import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Describes what the app should do
/// Like we want to cache on mobile but not on web and desktop
/// This files are here because this logic is gonna grow like crazy with the project
class Policies {
  bool shouldHaveTabChangeEffect(BuildContext context) {
    if (kIsWeb) return false;

    // disabled for now, i did not like how sliding transition looks
    if (Platform.isAndroid || Platform.isIOS) return false;

    return false;
  }

  bool shouldOverlayHaveTransparentBackground(BuildContext context) {
    if (!kIsWeb) return false;
    final w = MediaQuery.of(context).size.width;
    return w > 550;
  }
}
