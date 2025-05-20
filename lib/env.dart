import 'dart:js_interop';

@JS('window.env')
external EnvConfig get env;

@JS()
@staticInterop
class EnvConfig {}

extension EnvConfigExtension on EnvConfig {
  external String get API_URL;
}