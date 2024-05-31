import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  final String message;

  const Success(this.message);

  @override
  List<Object?> get props => [message];
}

// class OperationSuccess extends Success {
//   const OperationSuccess({required super.message})super.message;
// }

class OperationSuccess extends Success {
  const OperationSuccess(super.message);
}
