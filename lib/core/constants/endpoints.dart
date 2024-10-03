import 'package:dio/dio.dart';
import 'package:dio/io.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class Endpoint {
  final String path;
  final HttpMethod method;
  Map<String, dynamic>? queryParams;
  final Object? data;
  final Options? options;
  DioForNative? dio;
  Endpoint(
      {required this.path,
      required this.method,
      this.queryParams,
      this.data,
      this.options});
}

final class Endpoints {
  static Endpoint getSiteMenu = Endpoint(
    path: "web-client-gateway/menu/getSiteMenu",
    method: HttpMethod.get,
  );
}
