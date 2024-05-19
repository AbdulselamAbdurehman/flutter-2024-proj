import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_username_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late UpdateUsername updateUsername;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    updateUsername = UpdateUsername(mockAuthRepository);
  });

  group('UpdateUsername Tests', () {
    const newUsername = 'newUsername';

    test('should call updateUsername on the repository', () async {
      // Arrange
      when(mockAuthRepository.updateUsername(
              newUsername: anyNamed('newUsername')))
          .thenAnswer((_) async => const Right(Success('Username updated')));

      // Act
      await updateUsername(newUsername);

      // Assert
      verify(mockAuthRepository.updateUsername(newUsername: newUsername))
          .called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockAuthRepository.updateUsername(
              newUsername: anyNamed('newUsername')))
          .thenAnswer((_) async => const Right(Success('Username updated')));

      // Act
      final result = await updateUsername(newUsername);

      // Assert
      expect(result, const Right(Success('Username updated')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Update username failed');
      when(mockAuthRepository.updateUsername(
              newUsername: anyNamed('newUsername')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await updateUsername(newUsername);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
