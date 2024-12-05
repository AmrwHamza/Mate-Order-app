abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error ']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No Internat connection']);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Connection timeout']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = ' unknown error happened']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Invalid data provided']);
}
