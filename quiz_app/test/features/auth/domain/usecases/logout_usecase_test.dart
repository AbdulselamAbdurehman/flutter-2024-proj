import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/features/auth/domain/usecases/logout_usecase.dart';
import '../../../../mocks/mock_auth_repository.mocks.dart';

void main() {
  late Logout logout;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    logout = Logout(mockAuthRepository);
  });

  group('Logout Tests', () {
    test('should call logout on the repository', () async {
      // Arrange
      when(mockAuthRepository.logout()).thenAnswer((_) async {});

      // Act
      await logout();

      // Assert
      verify(mockAuthRepository.logout()).called(1);
    });
  });
}
