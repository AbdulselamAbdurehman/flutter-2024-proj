import 'package:learn/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel?> loginUser(String userId, String password, String role);
  //sign up
  //change username
  //change password
  //ToDo: Implement call to the api
}

class AuthRemoteDataSourceImple implements AuthRemoteDatasource {
  @override
  Future<UserModel?> loginUser(String userId, String password, String role) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}
