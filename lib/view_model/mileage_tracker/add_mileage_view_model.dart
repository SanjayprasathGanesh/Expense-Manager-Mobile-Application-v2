import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/mileage_tracker/mileage_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class AddMileageViewModel extends GetxController {
  TextEditingController startKm = TextEditingController();
  TextEditingController endKm = TextEditingController();
  TextEditingController ttlLitres = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();

  DatabaseConnection databaseConnection = DatabaseConnection();

  Widget buildForms() {
    List<Widget> fields = [
      Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: startKm,
              title: 'Enter the Start Km',
              showIcon: false,
              showPsw: false,
              textInputType: TextInputType.number,
              readOnly: false,
              validator: ValidationBuilder(
                      requiredMessage: 'Empty Start kilometre field')
                  .build(),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: MyTextField(
              controller: endKm,
              title: 'Enter the End Km',
              showIcon: false,
              showPsw: false,
              textInputType: TextInputType.number,
              readOnly: false,
              validator: ValidationBuilder(
                      requiredMessage: 'Empty End Kilometre field')
                  .build(),
            ),
          ),
        ],
      ),
      MyTextField(
        controller: ttlLitres,
        title: 'Enter the Total Litres',
        showIcon: false,
        showPsw: false,
        textInputType: const TextInputType.numberWithOptions(),
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Empty Total Litres field')
                .build(),
      ),
      MyTextField(
        controller: price,
        title: 'Enter the Price',
        showIcon: false,
        showPsw: false,
        textInputType: const TextInputType.numberWithOptions(),
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Empty Price field').build(),
      ),
      MyDatePicker(
        title: 'Select from date',
        firstDate: DateTime(2020),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        validator:
            ValidationBuilder(requiredMessage: 'Empty Date field').build(),
        controller: date,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields,
    );
  }

  addMileage() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    double litres = double.parse(ttlLitres.text);

    int ttlDistance = int.parse(endKm.text) - int.parse(startKm.text);
    double result = ttlDistance / litres;
    int m = result.toInt();

    Mileage mileage = Mileage(
      uName: uName,
      date: date.text,
      startKm: startKm.text,
      endKm: endKm.text,
      ttlLitres: double.parse(ttlLitres.text),
      price: double.parse(price.text),
      ttlDistance: ttlDistance.toString(),
      mileage: m.toString(),
    );

    await databaseConnection.addMileage(mileage);
  }
}
