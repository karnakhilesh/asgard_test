import 'package:asgard/app/core/errors/errors.dart';

abstract class AsgardException implements Exception {
  final String message;
  AsgardException(this.message);

  @override
  String toString() => message;
}

class InternalErrorException extends AsgardException {
  InternalErrorException([String? message])
      : super(message ?? internalErrorExceptionMessage);
}

class TimeoutException extends AsgardException {
  TimeoutException([String? message])
      : super(message ?? timeOutExceptionMessage);
}

class NetworkException extends AsgardException {
  NetworkException([String? message])
      : super(message ?? networkExceptionMessage);
}

class BadRequestException extends AsgardException {
  BadRequestException([String? message])
      : super(message ?? badRequestExceptionMessage);
}

class UnauthorisedException extends AsgardException {
  UnauthorisedException([String? message])
      : super(message ?? unauthorisedExceptionMessage);
}

class NotFoundException extends AsgardException {
  NotFoundException([String? message])
      : super(message ?? notFoundExceptionMessage);
}

class NullDataException extends AsgardException {
  NullDataException([String? message])
      : super(message ?? notFoundExceptionMessage);
}

class AsgardFormatException extends AsgardException {
  AsgardFormatException([String? message]) : super(message ?? formatException);
}

class AsgardServiceUnavailableException extends AsgardException {
  AsgardServiceUnavailableException([String? message])
      : super(message ?? serviceTemporarilyUnavailable);
}
