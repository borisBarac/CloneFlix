import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clone_flix/app/app.dart' as app;
import 'package:clone_flix/app/routes/router_state.dart';
import 'package:clone_flix/capabilities_and_policies/capabilities.dart';
import 'package:clone_flix/capabilities_and_policies/policies.dart';
import 'package:clone_flix/env/env.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  registerDependencies();
  await registerApiConfig();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

/// register all the get it dependencies
/// this is gonna get called before the app gets made
@visibleForTesting
void registerDependencies() {
  final router = app.AppRouter(RouterState());
  GetIt.I.registerSingleton(router);

  GetIt.I.registerSingleton(Policies());
  GetIt.I.registerSingleton(Capabilities());
}

Future<void> registerApiConfig() async {
  final config = <String, String>{
    'domain': Env.domain,
    'subdomain': Env.subdomain,
    'apiVersion': Env.apiVersion,
    'apiKey': Env.apiKey,
  };

  GetIt.I
      .registerSingleton<Map<String, String>>(config, instanceName: 'config');
}
