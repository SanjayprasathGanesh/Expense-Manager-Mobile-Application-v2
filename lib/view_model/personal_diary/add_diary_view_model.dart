import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/personal_diary/personal_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';
import '../../view/widgets/star_rating.dart';

class AddLeaveViewModel extends GetxController {
  TextEditingController date = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController content = TextEditingController();
  var rating = 0.0.obs;

  DatabaseConnection databaseConnection = DatabaseConnection();

  Widget buildForms() {
    List<Widget> fields = [
      MyDatePicker(
        title: 'Select the date',
        firstDate: DateTime(2020),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        validator:
            ValidationBuilder(requiredMessage: 'Empty Date field').build(),
        controller: date,
      ),
      MyTextField(
        controller: subject,
        title: 'Enter the Subject',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Empty subject field').build(),
        maxLines: 1,
      ),
      MyTextField(
        controller: content,
        title: 'Enter the Content',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator: ValidationBuilder(requiredMessage: 'Empty content field')
            .minLength(5)
            .maxLength(5000)
            .build(),
        maxLines: 7,
      ),
      const Text(
        "Rate Your Day",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      StarRating(
        onChanged: (newRating) {
          rating.value = newRating;
        },
        initialRating: rating.value,
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: fields,
    );
  }

  addDiary() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    DateTime dateTime = DateTime.parse(date.text);
    int m = dateTime.month;
    int year = dateTime.year;

    PersonalDiary personalDiary = PersonalDiary(
        uName: uName,
        date: date.text,
        month: '${months[m]},$year',
        sub: subject.text,
        content: content.text,
        rating: rating.value);

    await databaseConnection.addPersonalDiary(personalDiary);
  }
}
