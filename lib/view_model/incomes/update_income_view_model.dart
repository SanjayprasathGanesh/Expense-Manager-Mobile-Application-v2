import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/incomes/income_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class UpdateIncomeViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  RxBool isLoaded = false.obs;
  Rx<TextEditingController> incomeName = TextEditingController().obs;
  TextEditingController incomeDate = TextEditingController();
  TextEditingController incomeAmt = TextEditingController();
  Rx<TextEditingController> incomeType = TextEditingController().obs;
  Rx<TextEditingController> incomeTrans = TextEditingController().obs;

  List<String> incomeTypeList = [
    'Salary',
    'Rent',
    'Business Profit',
    'FD Interest',
    'Stocks',
    'Trading',
    'Others'
  ];
  List<String> incomeTransList = [
    'Cash',
    'Credit Card',
    'Debit Card',
    'UPI',
    'Net Banking'
  ];

  Widget buildForms() {
    List<Widget> fields = [
      MyTextField(
          controller: incomeName.call(),
          title: 'Enter Income Name',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Income name field')
                  .minLength(2)
                  .maxLength(30)
                  .build()),
      MyDatePicker(
          title: 'Select Income Date',
          firstDate: DateTime(2020),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          validator:
              ValidationBuilder(requiredMessage: 'Empty Income data field')
                  .build(),
          controller: incomeDate),
      MyTextField(
          controller: incomeAmt,
          title: 'Enter Income Amount',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.number,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Income amount field')
                  .minLength(1)
                  .maxLength(10)
                  .build()),
      const SizedBox(
        height: 5.0,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'Select your Income type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      Obx(() => MyDropDown(
          list: incomeTypeList,
          onChanged: (String? value) {
            incomeType.value.text = value!;
          },
          value: incomeType.value.text)),
      const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'Select your Income Transaction',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Obx(() => MyDropDown(
          list: incomeTransList,
          onChanged: (String? value) {
            incomeTrans.value.text = value!;
          },
          value: incomeTrans.value.text)),
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
    DocumentSnapshot ds = await databaseConnection.getIncomeById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    Incomes incomes = Incomes.fromJson(map);
    incomeName.value.text = incomes.incomeName!;
    incomeDate.text = incomes.incomeDate!;
    incomeAmt.text = incomes.incomeAmt!.toString();
    incomeType.value.text = incomes.incomeType!;
    incomeTrans.value.text = incomes.incomeTrans!;
    isLoaded.value = true;
  }

  updateIncome(String? id) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    String date = incomeDate.text;
    List<String> sub = date.split('-');

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
    String month = months[int.parse(sub[1])];
    String year = DateTime.parse(incomeDate.text).year.toString();

    Incomes incomes = Incomes(
      uName: uName,
      incomeName: incomeName.value.text,
      incomeDate: incomeDate.text,
      incomeAmt: int.parse(incomeAmt.text),
      incomeType: incomeType.value.text,
      incomeTrans: incomeTrans.value.text,
      month: '$month,$year',
    );
    await databaseConnection.updateIncome(id!, incomes);
  }
}
