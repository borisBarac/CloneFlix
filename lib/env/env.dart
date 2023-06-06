import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'domain')
  static const domain = _Env.domain;

  @EnviedField(varName: 'subdomain')
  static const subdomain = _Env.subdomain;

  @EnviedField(varName: 'apiVersion')
  static const apiVersion = _Env.apiVersion;

  @EnviedField(varName: 'apiKey')
  static const apiKey = _Env.apiKey;
}
