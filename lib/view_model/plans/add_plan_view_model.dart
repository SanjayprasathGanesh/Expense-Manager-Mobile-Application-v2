import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/myplans/plan_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class AddPlanViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController planName = TextEditingController();
  TextEditingController planBudget = TextEditingController();
  Rx<TextEditingController> startDate = TextEditingController().obs;
  Rx<TextEditingController> endDate = TextEditingController().obs;

  Widget buildForms() {
    List<Widget> fields = [
      MyTextField(
        controller: planName,
        title: 'Enter the Plan Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator:
            ValidationBuilder(requiredMessage: 'Empty Plan Name Field').build(),
      ),
      MyTextField(
        controller: planBudget,
        title: 'Enter the Plan Budget',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: false,
        validator: ValidationBuilder(requiredMessage: 'Empty Plan Budget Field')
            .build(),
      ),
      MyDatePicker(
        title: 'Select the Plan Start Date',
        firstDate: DateTime(DateTime.now().year - 10),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        validator:
            ValidationBuilder(requiredMessage: 'Empty Plan Start Date Field')
                .build(),
        controller: startDate.value,
      ),
      MyDatePicker(
        title: 'Select the Plan End Date',
        firstDate: DateTime(DateTime.now().year - 10),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        validator:
            ValidationBuilder(requiredMessage: 'Empty Plan End Date Field')
                .build(),
        controller: endDate.value,
      ),
    ];

    return Column(
      children: fields,
    );
  }

  addNewPlan() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    Plans plans = Plans(
        uName: uName,
        planName: planName.text,
        budget: int.parse(planBudget.text),
        ttlExp: 0,
        fromDate: startDate.value.text,
        toDate: endDate.value.text);

    await databaseConnection.addNewPlan(plans);
  }
}
