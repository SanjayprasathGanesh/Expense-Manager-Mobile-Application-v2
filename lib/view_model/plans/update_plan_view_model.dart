import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/myplans/plan_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class UpdatePlanViewModel extends GetxController {
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
        lastDate: DateTime(DateTime.now().month + 3),
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

  setInitialValues(String? id) async {
    DocumentSnapshot ds = await databaseConnection.getAllPlanById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    Plans plan = Plans.fromJson(map);
    planName.text = plan.planName!;
    planBudget.text = plan.budget.toString();
    startDate.value.text = plan.fromDate!;
    endDate.value.text = plan.toDate!;
  }

  updatePlan(String? id) async {
    //need to find the expenses total and need to update the ttlExp
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    Plans plans = Plans(
        uName: uName,
        planName: planName.text,
        budget: int.parse(planBudget.text),
        ttlExp: 0,
        fromDate: startDate.value.text,
        toDate: endDate.value.text);

    await databaseConnection.updatePlan(id, plans);
  }
}
