import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';
import '../../model/leave_tracker/leave_model.dart';
import '../../view/widgets/drop_down.dart';

class UpdateLeaveViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  Rx<TextEditingController> leaveType = TextEditingController().obs;
  TextEditingController reason = TextEditingController();
  var month = ''.obs;
  var ttlDays = 0.obs;
  RxBool isLoaded = false.obs;

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
      const Text(
        'Select the Type',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
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
      Obx(
        () => MyDropDown(
            list: typeList,
            onChanged: (String? value) {
              leaveType.value.text = value!;
            },
            value: leaveType.value.text),
      ),
      const SizedBox(
        height: 5.0,
      ),
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

  setInitialValues(String id) async {
    DocumentSnapshot ds = await databaseConnection.getLeaveById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    Leave leave = Leave.fromJson(map);
    fromDate.text = leave.fromDate!;
    toDate.text = leave.toDate!;
    leaveType.value.text = leave.leaveType!;
    reason.text = leave.reason!;
    month.value = leave.month!;
    ttlDays.value = leave.ttlDays!;
    isLoaded.value = true;
    update();
  }

  updateLeave(String? id) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    String d = fromDate.text;
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

    DateTime date1 = DateTime.parse(fromDate.text);
    DateTime date2 = DateTime.parse(toDate.text);
    Duration difference = date2.difference(date1);
    ttlDays.value = difference.inDays + 1;
    int year = date1.year;

    Leave leave = Leave(
      uName: uName,
      fromDate: fromDate.text,
      toDate: toDate.text,
      month: '${month.value},$year',
      leaveType: leaveType.value.text,
      reason: reason.text,
      ttlDays: ttlDays.value,
    );
    await databaseConnection.updateLeave(id!, leave);
  }
}
