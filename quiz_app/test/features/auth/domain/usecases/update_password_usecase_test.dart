import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_password_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late UpdatePassword updatePassword;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    updatePassword = UpdatePassword(mockAuthRepository);
  });

  group('UpdatePassword Tests', () {
    const oldPassword = 'oldPassword';
    const newPassword = 'newPassword';

    test('should call updatePassword on the repository', () async {
      // Arrange
      when(mockAuthRepository.updatePassword(
              oldPassword: anyNamed('oldPassword'),
              newPassword: anyNamed('newPassword')))
          .thenAnswer((_) async => const Right(Success('Password updated')));

      // Act
      await updatePassword(const UpdatePasswordParams(
          oldPassword: oldPassword, newPassword: newPassword));

      // Assert
      verify(mockAuthRepository.updatePassword(
              oldPassword: oldPassword, newPassword: newPassword))
          .called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockAuthRepository.updatePassword(
              oldPassword: anyNamed('oldPassword'),
              newPassword: anyNamed('newPassword')))
          .thenAnswer((_) async => const Right(Success('Password updated')));

      // Act
      final result = await updatePassword(const UpdatePasswordParams(
          oldPassword: oldPassword, newPassword: newPassword));

      // Assert
      expect(result, const Right(Success('Password updated')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Update password failed');
      when(mockAuthRepository.updatePassword(
              oldPassword: anyNamed('oldPassword'),
              newPassword: anyNamed('newPassword')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await updatePassword(const UpdatePasswordParams(
          oldPassword: oldPassword, newPassword: newPassword));

      // Assert
      expect(result, const Left(failure));
    });
  });
}
