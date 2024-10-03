import 'package:navalia_code_challenge/core/constants/flavor.dart';

class Urls {
  Urls._instance();
  static const String _prodBaseUrl = "https://api.app.tst.wendys.digital/";
  static const String _stagingBaseUrl = "https://api.app.tst.wendys.digital/";
  static const String _devBaseUrl = "https://api.app.tst.wendys.digital/";

  static String get baseUrl {
    String url = '';
    if (Flavor.isProduction) {
      url = _prodBaseUrl;
    } else if (Flavor.isStaging) {
      url = _stagingBaseUrl;
    } else if (Flavor.isDevelopment) {
      url = _devBaseUrl;
    }
    return url;
  }
}
