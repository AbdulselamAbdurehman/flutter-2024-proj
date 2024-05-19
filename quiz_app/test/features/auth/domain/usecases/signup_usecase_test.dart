import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/usecases/signup_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late Signup signup;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signup = Signup(mockAuthRepository);
  });

  group('Signup Tests', () {
    const username = 'testUser';
    const password = 'testPassword';
    const email = 'test@example.com';
    const role = 'user';

    test('should call signup on the repository', () async {
      // Arrange
      when(mockAuthRepository.signup(
              username: anyNamed('username'),
              password: anyNamed('password'),
              email: anyNamed('email'),
              role: anyNamed('role')))
          .thenAnswer((_) async => const Right(Success('Signup successful')));

      // Act
      await signup(const SignupParams(
          username: username, password: password, email: email, role: role));

      // Assert
      verify(mockAuthRepository.signup(
              username: username, password: password, email: email, role: role))
          .called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockAuthRepository.signup(
              username: anyNamed('username'),
              password: anyNamed('password'),
              email: anyNamed('email'),
              role: anyNamed('role')))
          .thenAnswer((_) async => const Right(Success('Signup successful')));

      // Act
      final result = await signup(const SignupParams(
          username: username, password: password, email: email, role: role));

      // Assert
      expect(result, const Right(Success('Signup successful')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Signup failed');
      when(mockAuthRepository.signup(
              username: anyNamed('username'),
              password: anyNamed('password'),
              email: anyNamed('email'),
              role: anyNamed('role')))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await signup(const SignupParams(
          username: username, password: password, email: email, role: role));

      // Assert
      expect(result, const Left(failure));
    });
  });
}
