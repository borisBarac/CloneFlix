import 'dart:io';

import 'package:flutter/foundation.dart';

bool isMobile() {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS;
}
