import 'dart:io';

import 'package:flutter/foundation.dart';

/// Describes what the app can do
/// Like if need to render some extra UI for not touch interface

/// This files are here because this logic is gonna grow like crazy with the project

class Capabilities {
  bool get useMobilePlayer {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }
}
