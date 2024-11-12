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

class AddExpenseViewModel extends GetxController {
  ImageController? imageController;

  AddExpenseViewModel() {
    imageController = Get.find<ImageController>();
  }

  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController expenseName = TextEditingController();
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
          controller: expenseName,
          title: 'Enter Expense Name',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Expense name field')
                  .minLength(2)
                  .maxLength(30)
                  .add((value) {
                    if (value != null && !value.isAlphabetOnly) {
                      return 'Expense name should contain only alphabets.';
                    }
                    return null;
                  }).build()),
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
                  .add((value) {
                      if (double.parse(value!) <= 0) {
                        return 'Expense amount must be greater than 0';
                      }
                      return null;
                      })
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
          value: expenseType.value.text.isNotEmpty
              ? expenseType.value.text
              : expenseTypeList[0],
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
          value: expenseTrans.value.text.isNotEmpty
              ? expenseTrans.value.text
              : expenseTransList[0],
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields,
    );
  }

  addExpense() async {
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

    Expense expense = Expense(
      uName: uName,
      expenseName: expenseName.text,
      expenseImg: AddExpenseViewModel().imageController?.getImage()?.path,
      expenseDate: expenseDate.text,
      expenseAmt: int.parse(expenseAmt.text),
      expenseType: expenseType.value.text.isNotEmpty
          ? expenseType.value.text
          : expenseTypeList[0],
      expenseTrans: expenseTrans.value.text.isNotEmpty
          ? expenseTrans.value.text
          : expenseTransList[0],
      month: '$month,$year',
    );
    await databaseConnection.addExpenses(expense);
  }
}
