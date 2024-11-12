import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/image_controller.dart';
import '../../controller/local_storage_controller.dart';
import '../../controller/username_controller.dart';
import '../../database/database_connection.dart';
import '../../model/users/user_model.dart';
import '../../view/widgets/date_picker.dart';
import '../../view/widgets/drop_down.dart';
import '../../view/widgets/text_field.dart';

class UpdateUserProfileViewModel extends GetxController {
  UsernameController? usernameController;
  ImageController? imageController;
  DatabaseConnection databaseConnection = DatabaseConnection();
  RxBool isLoaded = false.obs;
  RxString userDocId = "".obs;
  RxString psw = "".obs;
  RxString userImg = "".obs;

  UpdateUserProfileViewModel() {
    imageController = Get.find<ImageController>();
    usernameController = Get.find<UsernameController>();
    setInitialValues();
  }

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  Rx<TextEditingController> gender = TextEditingController().obs;
  TextEditingController email = TextEditingController();
  Rx<TextEditingController> maritalStatus = TextEditingController().obs;
  Rx<TextEditingController> type = TextEditingController().obs;

  List<String> genderList = [
    'Male',
    'Female',
    'Transgender',
    'Others',
    'Prefer not to Say'
  ];
  List<String> typeList = [
    'Student',
    'Single',
    'Bachelor',
    'Family Person',
    'Home Maker',
    'Senior Citizen'
  ];
  List<String> maritalList = ['Married', 'Unmarried'];

  Widget buildFields() {
    List<Widget> fields = <Widget>[
      MyTextField(
        controller: name,
        title: 'Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
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
      MyDatePicker(
          title: 'DOB',
          firstDate: DateTime(1950),
          initialDate: DateTime(2015),
          lastDate: DateTime(2020),
          validator:
              ValidationBuilder(requiredMessage: 'DOB is a required Field')
                  .minLength(10)
                  .maxLength(10)
                  .build(),
          controller: dob),
      MyTextField(
        controller: phoneNum,
        title: 'Phone Number',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: false,
        validator: ValidationBuilder()
            .required("Empty Phone Number field")
            .minLength(10)
            .maxLength(10)
            .build(),
      ),
      // MyDropDown(list: genderList, onChanged: (String value) { gender.value.text = value; }, value: gender.value.text,),
      const Text(
        'Select Your Gender',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      Obx(() => MyDropDown(
            list: genderList,
            onChanged: (String value) {
              gender.value.text = value;
            },
            value: gender.value.text,
          )),
      MyTextField(
        controller: email,
        title: 'Email',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.emailAddress,
        readOnly: false,
        validator:
            ValidationBuilder().required("Empty Email field").email().build(),
      ),
      const Text(
        'Select Your Marital Status',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      // MyDropDown(list: maritalList, onChanged: (String value) { maritalStatus.value.text = value; }, value: maritalStatus.value.text,),
      Obx(() => MyDropDown(
            list: maritalList,
            onChanged: (String value) {
              maritalStatus.value.text = value;
            },
            value: maritalStatus.value.text,
          )),
      const Text(
        'Select Your Type',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      // MyDropDown(list: typeList, onChanged: (String value) { type.value.text = value; }, value: type.value.text,),
      Obx(() => MyDropDown(
            list: typeList,
            onChanged: (String value) {
              type.value.text = value;
            },
            value: type.value.text,
          )),
    ];

    List<Widget> circularField = [
      const Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      )),
    ];

    return Obx(() => Column(
          children: isLoaded.isTrue ? fields : circularField,
        ));
  }

  void calculateAge(String dobString) {
    DateTime dob = DateTime.parse(dobString);
    final now = DateTime.now();
    int a = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      a--;
    }
    if (a >= 0) {
      a++;
      age.text = a.toString();
    }
  }

  setInitialValues() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot = await databaseConnection.getUserById(uName);
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    userDocId.value = documentSnapshot.id;

    Map<String, dynamic> map = documentSnapshot.data() as Map<String, dynamic>;
    User user = User.fromJson(map);
    imageController?.image.value = File(user.user_img!);
    name.text = user.name!;
    age.text = user.age!.toString();
    phoneNum.text = user.phone!;
    dob.text = user.dob!;
    gender.value.text = user.gender!;
    email.text = user.email!;
    maritalStatus.value.text = user.marital_status!;
    type.value.text = user.user_type!;
    isLoaded.value = true;
    psw.value = user.psw!;
    userImg.value = user.user_img!;
  }

  updateUserProfile() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    calculateAge(dob.text);
    User user = User(
        uName: uName,
        psw: psw.value,
        name: name.text,
        email: email.text,
        phone: phoneNum.text,
        dob: dob.text,
        age: int.parse(age.text),
        gender: gender.value.text,
        marital_status: maritalStatus.value.text,
        user_type: type.value.text,
        user_img: userImg.value);
    await databaseConnection.updateUserProfile(userDocId.value, user);
  }
}
