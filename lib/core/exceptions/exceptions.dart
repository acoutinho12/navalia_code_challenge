class DefaultException implements Exception {
  final String message;
  final int? code;

  DefaultException(this.message, {this.code});
}

class BadRequestException extends DefaultException {
  BadRequestException(super.message, {super.code});
}

class UnauthorizedException extends DefaultException {
  UnauthorizedException(super.message, {super.code});
}

class NotFoundException extends DefaultException {
  NotFoundException(super.message, {super.code});
}

class InternalServerException extends DefaultException {
  InternalServerException(super.message, {super.code});
}

class NoInternetException extends DefaultException {
  NoInternetException(super.message);
}

class TimeoutException extends DefaultException {
  TimeoutException(super.message);
}

class UnknownException extends DefaultException {
  UnknownException(super.message, {super.code});
}

class DioNullException extends DefaultException {
  DioNullException(super.message, {super.code});
}

class HttpMethodException extends DefaultException {
  HttpMethodException(super.message, {super.code});
}

class ErrorDefaultMessages {
  static const String timeoutExceptionMessage =
      'Request timed out. Please try again.';
  static const String networkExceptionMessage = 'Request was cancelled.';
  static const String noInternetExceptionMessage =
      'No internet connection. Please check your network settings.';
  static const String unknownExceptionMessage = 'An unknown error occurred.';
  static const String dioNullExceptionMessage = 'Dio instance is null';
    static const String httpExceptionMessage = 'Http method is not supported';

}
