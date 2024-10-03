enum FlavorTypes { dev, staging, prod }

class Flavor {
  factory Flavor() => _singleton;
  Flavor._internal();
  static final Flavor _singleton = Flavor._internal();

  static late FlavorTypes flavorType;

  static bool get isProduction => flavorType == FlavorTypes.prod;
  static bool get isStaging => flavorType == FlavorTypes.staging;
  static bool get isDevelopment => flavorType == FlavorTypes.dev;
}
