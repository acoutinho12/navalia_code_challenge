import 'package:navalia_code_challenge/core/constants/flavor.dart';
import 'package:navalia_code_challenge/core/constants/urls.dart';
import 'package:test/test.dart';

void main() {
  group('baseUrl by Flavor', () {
    test(
        'value should be https://api.app.tst.wendys.digital/ when Flavor.flavorType = FlavorTypes.dev;',
        () {
      Flavor.flavorType = FlavorTypes.dev;
      expect(Urls.baseUrl, "https://api.app.tst.wendys.digital/");
    });

    test(
        'value should be https://api.app.tst.wendys.digital/ when Flavor.flavorType = FlavorTypes.staging;',
        () {
      Flavor.flavorType = FlavorTypes.staging;
      expect(Urls.baseUrl, "https://api.app.tst.wendys.digital/");
    });

    test(
        'value should be https://api.app.tst.wendys.digital/ when Flavor.flavorType = FlavorTypes.prod;',
        () {
      Flavor.flavorType = FlavorTypes.prod;
      expect(Urls.baseUrl, "https://api.app.tst.wendys.digital/");
    });
  });

  group('imageBaseUrl by Flavor', () {
    test(
        'value should be https://app.wendys.com/ when Flavor.flavorType = FlavorTypes.dev;',
        () {
      Flavor.flavorType = FlavorTypes.dev;
      expect(Urls.imageBaseUrl, "https://app.wendys.com/");
    });

    test(
        'value should be https://app.wendys.com/ when Flavor.flavorType = FlavorTypes.staging;',
        () {
      Flavor.flavorType = FlavorTypes.staging;
      expect(Urls.imageBaseUrl, "https://app.wendys.com/");
    });

    test(
        'value should be https://app.wendys.com/ when Flavor.flavorType = FlavorTypes.prod;',
        () {
      Flavor.flavorType = FlavorTypes.prod;
      expect(Urls.imageBaseUrl, "https://app.wendys.com/");
    });
  });
}
