import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/expenses/expense_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../controller/image_controller.dart';
import '../../controller/local_storage_controller.dart';

class UpdateExpenseViewModel extends GetxController {
  ImageController? imageController;
  var expImg = ''.obs;
  RxBool isLoaded = false.obs;

  UpdateExpenseViewModel() {
    imageController = Get.find<ImageController>();
  }

  DatabaseConnection databaseConnection = DatabaseConnection();

  Rx<TextEditingController> expenseName = TextEditingController().obs;
  TextEditingController expenseDate = TextEditingController();
  TextEditingController expenseAmt = TextEditingController();
  Rx<TextEditingController> expenseType = TextEditingController().obs;
  Rx<TextEditingController> expenseTrans = TextEditingController().obs;

  List<String> expenseTypeList = [
    'Food',
    'Hotel Food',
    'Online Food Order',
    'Snacks',
    'Fuel',
    'Maintenance',
    'Fruits & Vegetables',
    'Groceries',
    'Dairy Products',
    'Provisional Items',
    'Health Care',
    'Stationary',
    'Fees',
    'Studies',
    'Clothes',
    'Rent',
    'Service',
    'Insurance',
    'Tax',
    'EMI',
    'Phone Recharge',
    'WIFI',
    'Electricity Bill',
    'Water Bill',
    'Cable Bill',
    'Gas Bill',
    'Maid Salary',
    'Beauty & Parlour',
    'Cosmetics',
    'Pooja Items',
    'Donation',
    'Subscription',
    'Appliances',
    'Gadgets',
    'Online Shopping',
    'Travelling fare',
    'Taxi Fare',
    'Personal',
    'Emergency',
    'Pharmacy Products',
    'Hospital Fare',
    'Others'
  ];

  List<String> expenseTransList = [
    'Cash',
    'Credit Card',
    'Debit Card',
    'UPI',
    'Net Banking'
  ];

  Widget buildForms() {
    List<Widget> fields = [
      MyTextField(
          controller: expenseName.call(),
          title: 'Enter Expense Name',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Expense name field')
                  .minLength(2)
                  .maxLength(30)
                  .build()),
      MyDatePicker(
          title: 'Select Expense Date',
          firstDate: DateTime(2020),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          validator:
              ValidationBuilder(requiredMessage: 'Empty Expense data field')
                  .build(),
          controller: expenseDate),
      MyTextField(
          controller: expenseAmt,
          title: 'Enter Expense Amount',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.number,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Expense amount field')
                  .minLength(1)
                  .maxLength(10)
                  .build()),
      const SizedBox(
        height: 5.0,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'Select your Expense type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      Obx(
        () => MyDropDown(
          list: expenseTypeList,
          onChanged: (String? value) {
            expenseType.value.text = value!;
          },
          value: expenseType.value.text,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'Select your Expense Transaction',
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
      Obx(
        () => MyDropDown(
          list: expenseTransList,
          onChanged: (String? value) {
            expenseTrans.value.text = value!;
          },
          value: expenseTrans.value.text,
        ),
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
    DocumentSnapshot ds = await databaseConnection.getExpenseById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    Expense expenses = Expense.fromJson(map);
    expenseName.value.text = expenses.expenseName!;
    // expImg.value = expenses.expenseImg!;
    if (expenses.expenseImg != null) {
      expImg.value = expenses.expenseImg!;
    } else {
      expImg.value = '';
    }
    expenseDate.text = expenses.expenseDate!;
    expenseAmt.text = expenses.expenseAmt!.toString();
    expenseType.value.text = expenses.expenseType!;
    expenseTrans.value.text = expenses.expenseTrans!;
    if (expenses.expenseImg != null) {
      imageController?.image.value = File(expImg.value);
    }
    isLoaded.value = true;
  }

  updateExpense(String? id) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    String date = expenseDate.text;
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
    String year = DateTime.parse(expenseDate.text).year.toString();

    Expense expenses = Expense(
      uName: uName,
      expenseName: expenseName.value.text,
      expenseImg: UpdateExpenseViewModel().imageController?.getImage()?.path,
      expenseDate: expenseDate.text,
      expenseAmt: int.parse(expenseAmt.text),
      expenseType: expenseType.value.text,
      expenseTrans: expenseTrans.value.text,
      month: '$month,$year',
    );
    await databaseConnection.updateExpense(id!, expenses);
  }
}
