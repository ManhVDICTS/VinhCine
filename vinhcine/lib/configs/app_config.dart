class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.baseUrl,
  });

  factory AppConfig.init() {
    const flavor = String.fromEnvironment(flavorKey);
    const baseUrl = String.fromEnvironment(baseURLKey);

    return const AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
    );
  }
  static const String flavorKey = 'FLAVOR';
  static const String baseURLKey = 'BASE_URL';

  final String flavor;

  /// BACK END
  final String baseUrl;
}
