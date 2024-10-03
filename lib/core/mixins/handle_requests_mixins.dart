import 'package:dio/dio.dart';
import 'package:navalia_code_challenge/core/constants/endpoints.dart';
import 'package:navalia_code_challenge/core/exceptions/exceptions.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';

mixin HandleRequestsMixins {
  Future<Response<T>> makeRequest<T>(Endpoint endpoint) async {
    final Dio? dio = endpoint.dio;
    final Map<String, dynamic>? queryParams = endpoint.queryParams;
    final String path = endpoint.path;
    final Object? data = endpoint.data;
    final Options options = endpoint.options ??
        Options(
          validateStatus: (status) =>
              status.orNegativeOne > 0 && status.orNegativeOne < 399,
        );
    if (dio != null) {
      switch (endpoint.method) {
        case HttpMethod.get:
          return dio.get<T>(path,
              data: data, queryParameters: queryParams, options: options);
        case HttpMethod.post:
          return dio.post<T>(path,
              data: data, queryParameters: queryParams, options: options);
        case HttpMethod.put:
          return dio.put<T>(path,
              data: data, queryParameters: queryParams, options: options);
        case HttpMethod.delete:
          return dio.delete<T>(path,
              data: data, queryParameters: queryParams, options: options);
        case HttpMethod.patch:
          return dio.patch<T>(path,
              data: data, queryParameters: queryParams, options: options);
        case HttpMethod.head:
          return dio.head<T>(path,
              data: data, queryParameters: queryParams, options: options);
        default:
          throw HttpMethodException(ErrorDefaultMessages.httpExceptionMessage);
      }
    } else {
      throw DioNullException(ErrorDefaultMessages.dioNullExceptionMessage);
    }
  }

  void handleError(DioException error) {
    final int? statusCode = error.response?.statusCode;

    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          throw BadRequestException(error.message.orEmpty, code: statusCode);
        case 401:
          throw UnauthorizedException(error.message.orEmpty, code: statusCode);
        case 404:
          throw NotFoundException(error.message.orEmpty, code: statusCode);
        case 500:
          throw InternalServerException(error.message.orEmpty,
              code: statusCode);
        default:
          throw UnknownException(ErrorDefaultMessages.unknownExceptionMessage,
              code: statusCode);
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw TimeoutException(ErrorDefaultMessages.timeoutExceptionMessage);
        case DioExceptionType.cancel:
          throw DefaultException(ErrorDefaultMessages.networkExceptionMessage);
        case DioExceptionType.connectionError:
          throw NoInternetException(
              ErrorDefaultMessages.noInternetExceptionMessage);
        default:
          throw UnknownException(ErrorDefaultMessages.unknownExceptionMessage,
              code: statusCode);
      }
    }
  }
}
