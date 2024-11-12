import 'package:expense_manager/controller/image_controller.dart';
import 'package:expense_manager/controller/username_controller.dart';
import 'package:expense_manager/service/validations.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';

import '../../database/database_connection.dart';
import '../../model/users/user_model.dart';

class SetUserProfileViewModel extends GetxController {
  UsernameController? usernameController;

  ImageController? imageController;

  DatabaseConnection databaseConnection = DatabaseConnection();

  SetUserProfileViewModel() {
    imageController = Get.find<ImageController>();
    usernameController = Get.find<UsernameController>();
  }

  TextEditingController uname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  Rx<TextEditingController> age = TextEditingController().obs;
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  Rx<TextEditingController> gender = TextEditingController().obs;
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
      age.value.text = a.toString();
    }
  }

  Widget buildForms() {
    List<Widget> fields = [
      MyTextField(
          controller: uname,
          title: 'User Name',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.name,
          readOnly: true,
          validator: (_) {}),
      MyTextField(
        controller: name,
        title: 'Enter Your Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.name,
        readOnly: false,
        validator: ValidationBuilder().required('Name is required').minLength(5).maxLength(20).build(),
      ),
      MyTextField(
        controller: email,
        title: 'Enter your Email',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.emailAddress,
        readOnly: false,
        validator: validateEmail,
      ),
      MyTextField(
        controller: phoneNo,
        title: 'Enter your Phone number',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Phone Number field is required.')
                .minLength(10)
                .maxLength(10)
                .phone('Phone Number must contain 10 digits.')
                .build(),
      ),
      MyDatePicker(
          title: 'Select your DOB',
          firstDate: DateTime(1950),
          initialDate: DateTime(2015),
          lastDate: DateTime(2020),
          validator:
              ValidationBuilder(requiredMessage: 'DOB is a required Field')
                  .build(),
          controller: dob),
      const Text(
        'Select Your Gender',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      MyDropDown(
        list: genderList,
        onChanged: (String value) {
          gender.value.text = value;
        },
        value: genderList[0],
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
      MyDropDown(
        list: maritalList,
        onChanged: (String value) {
          maritalStatus.value.text = value;
        },
        value: maritalList[0],
      ),
      const Text(
        'Select Your Type',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        height: 5.0,
      ),
      MyDropDown(
        list: typeList,
        onChanged: (String value) {
          type.value.text = value;
        },
        value: typeList[0],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields,
    );
  }

  void clearForm() {
    name.clear();
    age.value.clear();
    phoneNo.clear();
    email.clear();
    dob.clear();
    gender.value.text = genderList[0];
    maritalStatus.value.text = maritalList[0];
    type.value.text = typeList[0];
    update();
  }

  setUName() {
    uname.text = SetUserProfileViewModel().usernameController!.getName()!;
    Logger().w('User Name Setted ${uname.text}');
    update();
  }

  addUser() async {
    calculateAge(dob.text);
    User user = User(
      uName: uname.text,
      psw: SetUserProfileViewModel().usernameController!.getPsw()!,
      name: name.text,
      email: email.text,
      phone: phoneNo.text,
      dob: dob.text,
      age: int.parse(age.value.text),
      gender: gender.value.text.isNotEmpty ? gender.value.text : genderList[0],
      marital_status: maritalStatus.value.text.isNotEmpty
          ? maritalStatus.value.text
          : maritalList[0],
      user_type: type.value.text.isNotEmpty ? type.value.text : typeList[0],
      user_img: SetUserProfileViewModel().imageController!.getImage()!.path,
    );
    await databaseConnection.addUser(user);
    Logger().w('${uname.text} User Signed up Successfully');
  }
}
