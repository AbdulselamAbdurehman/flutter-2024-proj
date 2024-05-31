import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';

class InputConverter {
  Either<Failure, int> stringToInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return const Left(ValidationFailure("Input must be positive number"));
    }
  }
}
