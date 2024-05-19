// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/usecases/delete_user_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late DeleteUser deleteUser;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    deleteUser = DeleteUser(mockAuthRepository);
  });

  group('DeleteUser Tests', () {
    test('should call deleteUser on the repository', () async {
      // Arrange
      print('Test start: should call deleteUser on the repository');
      when(mockAuthRepository.deleteUser())
          .thenAnswer((_) async => const Right(Success('User deleted')));

      // Act
      await deleteUser();
      print('After useCase call');

      // Assert
      verify(mockAuthRepository.deleteUser()).called(1);
      print('Verification done');
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      print(
          'Test start: should return Success when the call to repository is successful');
      when(mockAuthRepository.deleteUser())
          .thenAnswer((_) async => const Right(Success('User deleted')));

      // Act
      final result = await deleteUser();
      print('After useCase call');

      // Assert
      expect(result, const Right(Success('User deleted')));
      print('Verification done');
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      print(
          'Test start: should return Failure when the call to repository is unsuccessful');
      final failure = const Failure('Delete user failed');
      when(mockAuthRepository.deleteUser())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await deleteUser();
      print('After useCase call');

      // Assert
      expect(result, Left(failure));
      print('Verification done');
    });
  });
}
