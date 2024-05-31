import 'package:quiz_app/core/utils/utility_objects.dart';

class AuthLocalDataSource {
  final LocalDataSource localDataSource;

  AuthLocalDataSource({required this.localDataSource});

  Future<void> setToken(String newToken) async {
    await localDataSource.setToken(newToken);
  }

  Future<String?> getToken() async {
    return localDataSource.getToken();
  }

  Future<void> clearToken() async {
    await localDataSource.clearToken();
  }
}
