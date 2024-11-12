import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';
import '../../database/database_connection.dart';
import '../../model/users/user_model.dart';
import '../../view/widgets/text_field.dart';

class UserProfileViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController type = TextEditingController();

  Widget buildFields() {
    List<Widget> fields = [
      MyTextField(
        controller: name,
        title: 'Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: true,
        validator: ValidationBuilder().required("Empty Name Field").build(),
      ),
      MyTextField(
        controller: age,
        title: 'Age',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: true,
        validator: ValidationBuilder().required("Empty Age Field").build(),
      ),
      MyTextField(
        controller: dob,
        title: 'DOB',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.datetime,
        readOnly: true,
        validator: ValidationBuilder()
            .required("Empty DOB Field")
            .minLength(10)
            .maxLength(10)
            .build(),
      ),
      MyTextField(
        controller: phoneNum,
        title: 'Phone Number',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: true,
        validator: ValidationBuilder()
            .required("Empty Phone Number field")
            .minLength(10)
            .maxLength(10)
            .build(),
      ),
      MyTextField(
        controller: gender,
        title: 'Gender',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: true,
        validator: (_) {},
      ),
      MyTextField(
        controller: email,
        title: 'Email',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.emailAddress,
        readOnly: true,
        validator:
            ValidationBuilder().required("Empty Email field").email().build(),
      ),
      MyTextField(
        controller: maritalStatus,
        title: 'Marital Status',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: true,
        validator: (_) {},
      ),
      MyTextField(
        controller: type,
        title: 'Type',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: true,
        validator: (_) {},
      ),
    ];

    return Column(
      children: fields,
    );
  }

  setInitialValues() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot = await databaseConnection.getUserById(uName);
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    Map<String, dynamic> map = documentSnapshot.data() as Map<String, dynamic>;
    User user = User.fromJson(map);
    name.text = user.name!;
    age.text = user.age!.toString();
    phoneNum.text = user.phone!;
    dob.text = user.dob!;
    gender.text = user.gender!;
    email.text = user.email!;
    maritalStatus.text = user.marital_status!;
    type.text = user.user_type!;
    update();
  }
}
