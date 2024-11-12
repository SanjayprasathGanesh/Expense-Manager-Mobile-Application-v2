import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/personal_diary/personal_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/star_rating.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class UpdateDiaryViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController date = TextEditingController();
  RxBool isLoaded = false.obs;
  var month = ''.obs;
  TextEditingController subject = TextEditingController();
  TextEditingController content = TextEditingController();
  var rating = 0.0.obs;

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
      Obx(
        () => StarRating(
          initialRating: rating.value,
          onChanged: (newRating) {
            rating.value = newRating;
          },
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];

    List<Widget> circularField = [
      const Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      )),
    ];

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isLoaded.isTrue ? fields : circularField,
        ));
  }

  setInitialValues(String id) async {
    DocumentSnapshot ds = await databaseConnection.getDiaryById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    PersonalDiary personalDiary = PersonalDiary.fromJson(map);
    date.text = personalDiary.date!;
    subject.text = personalDiary.sub!;
    content.text = personalDiary.content!;
    month.value = personalDiary.month!;
    rating.value = personalDiary.rating!;
    isLoaded.value = true;
    update();
  }

  updateDiary(String? id) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    String d = date.text;
    List<String> sub = d.split('-');

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
    String m = months[int.parse(sub[1])];
    month.value = m;
    int year = DateTime.parse(date.text).year;

    PersonalDiary personalDiary = PersonalDiary(
      uName: uName,
      date: date.text,
      month: '${month.value},$year',
      sub: subject.text,
      content: content.text,
      rating: rating.value,
    );
    await databaseConnection.updateDiary(id!, personalDiary);
  }
}
