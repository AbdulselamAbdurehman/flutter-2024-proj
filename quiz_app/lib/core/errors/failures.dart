import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class OperationFailure extends Failure {
  const OperationFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class InvalidInput extends Failure {
  const InvalidInput(super.message);
}

class DataBaseFailure extends Failure {
  const DataBaseFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
