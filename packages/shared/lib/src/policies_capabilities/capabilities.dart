import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shared/shared_helpers.dart';

/// Describes what we can do and can not do depending on where the app is running
/// <br> To override package defaults from the main app follow the steps
/// <br> Make a implementation class base on `CapabilitiesDefinition`
/// <br> register it with get_it
abstract class CapabilitiesDefinition {
  ///
  bool get shouldHaveArrowsInHorizontalLists;
}

/// Describes what we can do and can not do depending on where the app is running
/// <br> Do not export
class CapabilitiesPackageDefaults implements CapabilitiesDefinition {
  ///
  @override
  bool get shouldHaveArrowsInHorizontalLists {
    /// Platform is not defined on the web = component is not gonna draw
    /// but the app is still gonna work 🤪
    if (kIsWeb) {
      return !isWebBrowserWithTouchScreen();
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return false;
    } else {
      return true;
    }
  }
}
