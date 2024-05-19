// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/usecases/login_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late Login login;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    login = Login(mockAuthRepository);
  });

  group('Login Tests', () {
    final userId = 'testUser';
    final password = 'testPassword';
    final role = 'user';

    test('should call login on the repository', () async {
      // Arrange
      when(mockAuthRepository.login(
              userId: anyNamed('userId'),
              password: anyNamed('password'),
              role: anyNamed('role')))
          .thenAnswer((_) async => Right(Success('Login successful')));

      // Act
      await login(LoginParams(userId: userId, password: password, role: role));

      // Assert
      verify(mockAuthRepository.login(
              userId: userId, password: password, role: role))
          .called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockAuthRepository.login(
              userId: anyNamed('userId'),
              password: anyNamed('password'),
              role: anyNamed('role')))
          .thenAnswer((_) async => Right(Success('Login successful')));

      // Act
      final result = await login(
          LoginParams(userId: userId, password: password, role: role));

      // Assert
      expect(result, Right(Success('Login successful')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      final failure = Failure('Login failed');
      when(mockAuthRepository.login(
              userId: anyNamed('userId'),
              password: anyNamed('password'),
              role: anyNamed('role')))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await login(
          LoginParams(userId: userId, password: password, role: role));

      // Assert
      expect(result, Left(failure));
    });
  });
}
