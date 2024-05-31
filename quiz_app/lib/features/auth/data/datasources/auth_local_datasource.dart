import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource({required this.sharedPreferences});

  static const token = 'TOKEN';

  Future<void> setToken(String newToken) async {
    await sharedPreferences.setString(token, newToken);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(token);
  }

  Future<void> clearToken() async {
    await sharedPreferences.remove(token);
  }
}
