import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../controller/local_storage_controller.dart';

class LoginViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();
  final LocalLoginStorageController localStorage = LocalLoginStorageController();

  TextEditingController uName = TextEditingController();
  TextEditingController psw = TextEditingController();

  Widget buildLoginForm() {
    List<Widget> fields = [
      MyTextField(
        controller: uName,
        title: 'Enter your User Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator: (_) {},
      ),
      MyTextField(
        controller: psw,
        title: 'Enter your Password',
        showIcon: true,
        showPsw: true,
        textInputType: TextInputType.visiblePassword,
        readOnly: false,
        validator: (_) {},
        maxLines: 1,
      ),
    ];

    return Column(
      children: fields,
    );
  }

  void getUserCredentials() async {
    Map<String, String?> userCredMap = await localStorage.getUserCredentials();
    if(userCredMap['username']!.isNotEmpty) {
      uName.text = userCredMap['username']!;
      psw.text = userCredMap['password']!;
      update();
    }
  }


  Future<bool> login() async {
    QuerySnapshot querySnapshot = await databaseConnection.checkUserExist(uName.text);
    if (querySnapshot.size >= 1) {
      QuerySnapshot querySnapshot = await databaseConnection.checkUserDetails(uName.text, psw.text);
      if (querySnapshot.size == 1) {
        Logger().i("Logged in Successfully");
        localStorage.saveUserCredentialsWithValues(uName.text, psw.text);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
