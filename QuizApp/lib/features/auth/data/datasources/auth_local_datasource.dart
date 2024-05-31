import 'package:learn/features/auth/data/models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<UserModel?> getUserFromCache();
  Future<void> cacheUser(UserModel user);
}

class AuthLocalDataSourceImpl implements AuthLocalDatasource {
  @override
  Future<UserModel?> getUserFromCache() {
    // TODO: implement getUserFromCache
    throw UnimplementedError();
  }

  @override
  Future<void> cacheUser(UserModel user) {
    // TODO: implement getUserFromCache
    throw UnimplementedError();
  }
}
