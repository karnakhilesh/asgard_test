abstract class AsgardFailure {
  String message;
  AsgardFailure(this.message);
}

class InternalErrorFailure extends AsgardFailure {
  InternalErrorFailure(super.message);
}

class NetworkFailure extends AsgardFailure {
  NetworkFailure(super.message);
}

class BadRequestFailure extends AsgardFailure {
  BadRequestFailure(super.message);
}

class UnauthorisedFailure extends AsgardFailure {
  UnauthorisedFailure(super.message);
}

class NotFoundFailure extends AsgardFailure {
  NotFoundFailure(super.message);
}

class NullDataFailure extends AsgardFailure {
  NullDataFailure(super.message);
}
