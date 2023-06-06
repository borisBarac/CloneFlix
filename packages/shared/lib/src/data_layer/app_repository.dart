// ignore_for_file: public_member_api_docs

import 'package:api_core/api_core.dart';
import 'package:get_it/get_it.dart';

// config example
// <String, String>{
//   'domain': domain,
//   'subdomain': subdomain,
//   'apiVersion': apiVersion,
//   'apiKey': apiKey,
// };

class AppRepository {
  AppRepository(this.config, this.apiCore);

  AppRepository.initWithGetIt() : config = {} {
    if (_checkGetIt() == false) {
      throw ArgumentError('Config has not been registered in the main app');
    } else {
      config = GetIt.I.get<Map<String, String>>(instanceName: 'config');
      apiCore = ApiCore.from(() => config['apiKey'] ?? '');
    }
  }

  Map<String, String> config;

  late ApiCore apiCore;
  List<Object> rawData = [];

  String get domain {
    return config['domain'] ?? '';
  }

  String get subDomain {
    return config['subdomain'] ?? '';
  }

  String get apiVersion {
    return config['apiVersion'] ?? '';
  }
}

bool _checkGetIt() =>
    GetIt.I.isRegistered<Map<String, String>>(instanceName: 'config');
