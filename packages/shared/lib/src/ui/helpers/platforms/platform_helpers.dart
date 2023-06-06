import 'platform_helpers_io.dart'
    if (dart.library.html) 'platform_helpers_web.dart';

/// is app running in a browser with touchscreen
bool isWebBrowserWithTouchScreen() => checkUserAgentForTouch();
