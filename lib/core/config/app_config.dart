import 'flavors.dart';

/// Central place for anything that varies per build flavor. Everything else
/// in `core/` reads from here rather than branching on [Flavor] directly.
class AppConfig {
  AppConfig._(this.flavor, this.baseUrl);

  final Flavor flavor;

  /// Includes the `/api/v1` prefix — every endpoint in
  /// `core/network/api_endpoints.dart` is relative to this.
  final String baseUrl;

  static final AppConfig instance = _build();

  static AppConfig _build() {
    final flavor = flavorFromEnv();
    switch (flavor) {
      case Flavor.dev:
        // emulator talking to a backend running on your host machine).
        return AppConfig._(flavor, 'http://192.168.0.248:8080/api/v1');
      case Flavor.staging:
        return AppConfig._(flavor, 'https://staging-api.boibritto.app/api/v1');
      case Flavor.prod:
        return AppConfig._(flavor, 'https://api.boibritto.app/api/v1');
    }
  }
}