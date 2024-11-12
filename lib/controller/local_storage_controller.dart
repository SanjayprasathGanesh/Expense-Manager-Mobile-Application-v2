import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:logger/logger.dart';
import '../model/users/user_model.dart';

class LocalLoginStorageController {
  Future<void> saveUserCredentials(User user) async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    localStorage.setString("username", user.uName!);
    localStorage.setString("password", user.psw!);
    Logger().i('User Credentials saved successfully');
  }

  Future<void> saveUserCredentialsWithValues(String uName, String psw) async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    localStorage.setString("username", uName);
    localStorage.setString("password", psw);
    Logger().i('User Credentials saved successfully');
    getUserCredentials();
  }

  Future<Map<String, String?>> getUserCredentials() async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    String? userName = localStorage.getString("username");
    String? psw = localStorage.getString("password");
    Logger().w("User name : $userName, Psw: $psw");
    return {
      'username': userName,
      'password': psw,
    };
  }

  Future<void> deleteLoginCredentials() async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    await localStorage.remove('username');
    await localStorage.remove('password');
    Logger().i('Credentials deleted successfully');
  }

  getUserName() async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    String? name = localStorage.getString('username');
    return name;
  }

  getUserPsw() async {
    final LocalStorageInterface localStorage = await LocalStorage.getInstance();
    String? psw = localStorage.getString('password');
    return psw;
  }
}
