import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Android can pick up theme changes out of the box
/// <br> iOS needs app reload for now (default flutter),
/// but this can be avoided by putting the app in the StateWidget,
/// and listening for system changes
PlatformBuilder<MaterialAppData> get materialAndCupertino =>
    (context, platform) => MaterialAppData(
          theme: themeDataLight,
          darkTheme: themeDataDark,
          themeMode: ThemeMode.system,
        );

// theme package with preloaded themes: https://pub.dev/packages/flex_color_scheme
// web app playground:https://rydmike.com/flexcolorscheme/themesplayground-v6/#/

/// NOTE: `ThemeData(cupertinoOverrideTheme: ..)` does not really work
ThemeData themeDataLight = FlexThemeData.light(scheme: FlexScheme.greenM3);

ThemeData themeDataDark = FlexThemeData.dark(scheme: FlexScheme.green);
