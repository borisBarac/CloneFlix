import 'package:clone_flix/bootstrap.dart';
import 'package:get_it/get_it.dart';

void registerTestDependencies() {
  _registerConfig();
  //TODO: replace with mocks
  registerDependencies();
}

void _registerConfig() {
  final config = <String, String>{
    'domain': 'fake',
    'subdomain': 'fake',
    'apiVersion': 'fake',
    'apiKey': 'fake',
  };

  GetIt.I
      .registerSingleton<Map<String, String>>(config, instanceName: 'config');
}
