enum Flavor { dev, staging, prod }

/// Resolved once at app start from a build-time define:
///   flutter run --dart-define=FLAVOR=dev
/// Defaults to [Flavor.dev] so a plain `flutter run` works out of the box.
Flavor flavorFromEnv() {
  const raw = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  return Flavor.values.firstWhere(
    (f) => f.name == raw,
    orElse: () => Flavor.dev,
  );
}