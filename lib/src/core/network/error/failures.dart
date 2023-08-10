import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

// General failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(String errorMessage, this.statusCode)
      : super(errorMessage);
}

class CacheFailure extends Failure {
  const CacheFailure(String errorMessage) : super(errorMessage);
}

// General failures
class FlightNotAvailableFailure extends Failure {
  final int? statusCode;

  const FlightNotAvailableFailure(String errorMessage, this.statusCode)
      : super(errorMessage);
}

// Cancel Request failures
class CancelRequestFailure extends Failure {
  const CancelRequestFailure(String errorMessage) : super(errorMessage);
}
