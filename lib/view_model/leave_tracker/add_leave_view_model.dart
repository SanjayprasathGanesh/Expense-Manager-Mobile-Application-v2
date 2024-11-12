import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/leave_tracker/leave_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class AddLeaveViewModel extends GetxController {
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  Rx<TextEditingController> leaveType = TextEditingController().obs;
  TextEditingController reason = TextEditingController();

  DatabaseConnection databaseConnection = DatabaseConnection();

  List<String> typeList = [
    'Function',
    'Outing',
    'Personal Reason',
    'Emergency Leave',
    'Sick Leave',
    'Others'
  ];

  Widget buildForms() {
    List<Widget> fields = [
      MyDatePicker(
        title: 'Select from date',
        firstDate: DateTime(2020),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        validator:
            ValidationBuilder(requiredMessage: 'Empty From Date field').build(),
        controller: fromDate,
      ),
      MyDatePicker(
        title: 'Select to date',
        firstDate: DateTime(2020),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        validator:
            ValidationBuilder(requiredMessage: 'Empty To Date field').build(),
        controller: toDate,
      ),
      MyTextField(
        controller: reason,
        title: 'Enter the Reason',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Empty reason field').build(),
        maxLines: 5,
      ),
      const SizedBox(
        height: 5.0,
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Select the Type',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      MyDropDown(
          list: typeList,
          onChanged: (String? value) {
            leaveType.value.text = value!;
          },
          value: typeList[0]),
      const SizedBox(
        height: 5.0,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields,
    );
  }

  addLeave() async {
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
    DateTime dateTime = DateTime.parse(fromDate.text);
    int m = dateTime.month;
    int year = dateTime.year;

    DateTime date1 = DateTime.parse(fromDate.text);
    DateTime date2 = DateTime.parse(toDate.text);
    Duration difference = date2.difference(date1);
    int ttlDays = difference.inDays + 1;

    Leave leave = Leave(
      uName: uName,
      fromDate: fromDate.text,
      toDate: toDate.text,
      month: '${months[m]},$year',
      leaveType: leaveType.value.text,
      reason: reason.text,
      ttlDays: ttlDays,
    );

    await databaseConnection.addLeave(leave);
  }
}
