abstract class Failure {
  final String message;
  Failure(this.message);
}

class BadRequestFailure extends Failure {
  BadRequestFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(super.message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.message);
}

class InternalServerFailure extends Failure {
  InternalServerFailure(super.message);
}

class NoInternetFailure extends Failure {
  NoInternetFailure(super.message);
}

class TimeoutFailure extends Failure {
  TimeoutFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

class DioNullFailure extends Failure {
  DioNullFailure(super.message);
}

class HttpMethodFailure extends Failure {
  HttpMethodFailure(super.message);
}

class ErrorDefaultMessages {
  static const String timeoutFailureMessage =
      'Request timed out. Please try again.';
  static const String networkFailureMessage = 'Request was cancelled.';
  static const String noInternetFailureMessage =
      'No internet connection. Please check your network settings.';
  static const String unknownFailureMessage = 'An unknown error occurred.';
  static const String dioNullFailureMessage = 'Dio instance is null';
  static const String httpFailureMessage = 'Http method is not supported';
}
