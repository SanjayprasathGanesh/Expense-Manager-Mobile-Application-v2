import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';
import '../../service/validations.dart';
import '../../view/widgets/text_field.dart';

class SignupViewModel extends GetxController {
  TextEditingController uName = TextEditingController();
  TextEditingController psw = TextEditingController();
  TextEditingController cPsw = TextEditingController();

  DatabaseConnection databaseConnection = DatabaseConnection();

  Widget buildSignupForm() {
    List<Widget> fields = [
      MyTextField(
        controller: uName,
        title: 'Enter your User Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator: validateUserName,
      ),
      MyTextField(
        controller: psw,
        title: 'Enter your Password',
        showIcon: true,
        showPsw: true,
        textInputType: TextInputType.visiblePassword,
        readOnly: false,
        validator: validateUserPassword,
        maxLines: 1,
      ),
      MyTextField(
        controller: cPsw,
        title: 'Confirm your Password',
        showIcon: true,
        showPsw: true,
        textInputType: TextInputType.visiblePassword,
        readOnly: false,
        validator: (_){},
        maxLines: 1,
      ),
    ];

    return Column(
      children: fields,
    );
  }

  showValidation(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Validation Details for a UserName Creation',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            content: Container(
              padding: const EdgeInsets.all(5.0),
              height: 380,
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User name Must only start with a alphabet of Lower Case',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'User name length must be minimum of 7',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'User name must contain 2 Numbers and a Special Character',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'User name must not have a upper case in it',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Eg : abcdef_12',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Validation Details for a Password Creation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Password Must contain a minimum length of 8 letters',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Password must contain atleast a single upper and lower case letters',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Password must contain 2 Numbers and a Special Character',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Eg : AbcdeF^54',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<bool> checkUserIdExist() async {
    QuerySnapshot querySnapshot =
        await databaseConnection.checkUserExist(uName.text);
    if (querySnapshot.size >= 1) {
      return false;
    } else {
      return true;
    }
  }

  void setUserCredentials() async {
    LocalLoginStorageController localStorage = LocalLoginStorageController();
    localStorage.saveUserCredentialsWithValues(uName.text, psw.text);
  }
}
