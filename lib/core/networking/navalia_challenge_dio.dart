import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:navalia_code_challenge/core/constants/urls.dart';

class NavaliaChallengeDio extends DioForNative {
  NavaliaChallengeDio() {
    options = BaseOptions(baseUrl: Urls.baseUrl);
  }
}
