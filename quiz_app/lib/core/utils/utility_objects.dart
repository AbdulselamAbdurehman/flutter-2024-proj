import 'package:connectivity_plus/connectivity_plus.dart'; // Package for checking network connectivity
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Success extends Equatable {
  final String message;

  const Success(this.message);

  @override
  List<Object?> get props => [message];
}

class OperationSuccess extends Success {
  const OperationSuccess(super.message);
}

// Function to validate email addresses
String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

// Class for handling local data storage
class LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});

  static const token = 'TOKEN'; // Key for storing token

  // Method to set a new token
  Future<void> setToken(String newToken) async {
    await sharedPreferences.setString(token, newToken);
  }

  // Method to get the stored token
  Future<String?> getToken() async {
    return sharedPreferences.getString(token);
  }

  // Method to clear the stored token
  Future<void> clearToken() async {
    await sharedPreferences.remove(token);
  }
}

// Function to check if the device is connected to the internet
Future<bool> deviceIsConnected() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

  // Check for various types of connectivity
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    return true;
  }
  return false;
}
