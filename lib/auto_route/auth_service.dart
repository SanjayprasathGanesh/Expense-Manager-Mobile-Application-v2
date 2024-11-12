import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetxController {
  RxBool isLoggedIn = false.obs;

  void login() {
    isLoggedIn.value = true;
    Logger().i('Logged In Successfully : ${isLoggedIn.value}');
  }

  void logout() {
    isLoggedIn.value = false;
    Logger().w('Logged out Successfully : ${isLoggedIn.value}');
  }

  bool getLoggedIn(){
    return isLoggedIn.value;
  }
}

