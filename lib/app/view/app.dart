import 'package:clone_flix/app/routes/routes.dart';
import 'package:clone_flix/app/view/theme_data.dart';
import 'package:clone_flix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  Brightness _brightness = Brightness.light;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();
    const localizationsDelegates = AppLocalizations.localizationsDelegates;

    return Theme(
      data: _brightness == Brightness.light ? themeDataLight : themeDataDark,
      child: PlatformApp.router(
        localizationsDelegates: localizationsDelegates,
        routerConfig: router.goRouter,
      ),
    );
  }
}

/*
    PlatformApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          material: materialAndCupertino,
        ),

    final materialApp = MaterialApp.router(
      localizationsDelegates: localizationsDelegates,
      theme: themeDataLight,
      darkTheme: themeDataDark,
      routerConfig: router.goRouter,
    );

    final cupertinoApp = CupertinoApp.router(
      localizationsDelegates: localizationsDelegates,
      routerConfig: router.goRouter,
    );
    */