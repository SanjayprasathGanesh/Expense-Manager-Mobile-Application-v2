import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/mygarage/accessories_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../controller/image_controller.dart';
import '../../controller/local_storage_controller.dart';

class AddAccessoriesViewModel extends GetxController {
  ImageController? imageController;

  AddAccessoriesViewModel() {
    imageController = Get.find<ImageController>();
  }

  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController accessoryName = TextEditingController();
  TextEditingController buyedOn = TextEditingController();
  TextEditingController buyedFrom = TextEditingController();
  Rx<TextEditingController> transType = TextEditingController().obs;
  TextEditingController price = TextEditingController();

  List<String> transList = [
    'Cash',
    'UPI',
    'Net Banking',
    'Debit Card',
    'Credit Card'
  ];

  Widget buildForms() {
    List<Widget> fields = [
      MyTextField(
        controller: accessoryName,
        title: 'Enter the Accessory Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator: ValidationBuilder().required('Empty Accessory Name').build(),
      ),
      MyDatePicker(
          title: 'Select the Date',
          firstDate: DateTime(DateTime.now().year - 5),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          validator: ValidationBuilder().required('Empty Date').build(),
          controller: buyedOn),
      MyTextField(
        controller: buyedFrom,
        title: 'Accessory Buyed From',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator:
            ValidationBuilder().required('Empty Accessory Buyed From').build(),
      ),
      MyTextField(
        controller: price,
        title: 'Accessory Price',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: false,
        validator:
            ValidationBuilder().required('Empty Accessory Price').build(),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          'Select the Transaction Type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      MyDropDown(
          list: transList,
          onChanged: (String value) {
            transType.value.text = value;
          },
          value: transList[0]),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields,
    );
  }

  addAccessories(String? vehicleName) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    Accessories accessories = Accessories(
        uName: uName,
        billImg: AddAccessoriesViewModel().imageController?.getImage()?.path,
        vehicleName: vehicleName,
        accessoryName: accessoryName.text,
        buyedOn: buyedOn.text,
        buyedFrom: buyedFrom.text,
        transType: transType.value.text,
        price: double.parse(price.text));

    await databaseConnection.addAccessories(accessories);
  }
}
