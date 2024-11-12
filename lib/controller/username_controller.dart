import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UsernameController extends GetxController {
  var uName = ''.obs;
  var psw = ''.obs;

  setName(String name) {
    uName.value = name;
    Logger().w('User Name Setted: ${uName.value}');
  }

  String? getName() {
    Logger().w('User Name Get: ${uName.value}');
    return uName.value;
  }

  setPsw(String password) {
    psw.value = password;
    Logger().w('Password Setted: ${psw.value}');
  }

  String? getPsw() {
    Logger().w('User Psw Get: ${psw.value}');
    return psw.value;
  }
}
