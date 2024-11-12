import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/myplans/plan_exp_model.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class ViewAllExpPlansViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();
  var ttlExp = 0.obs;

  Future<List<PlanExpense>> getAllExpPlans(String? planName) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<PlanExpense> expList = [];
    int amt = 0;
    QuerySnapshot qs = await databaseConnection.getAllExpPlan(uName, planName);
    for (int i = 0; i < qs.size; i++) {
      Map<String, dynamic> json = qs.docs[i].data() as Map<String, dynamic>;
      PlanExpense planExpense = PlanExpense.fromJson(json);
      amt += planExpense.planExpenseAmt!;
      expList.add(planExpense);
    }

    ttlExp.value = amt;
    return expList;
  }

  Future<List<String>> getAllExpPlansId(String? planName) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> idsList = [];
    QuerySnapshot qs = await databaseConnection.getAllExpPlan(uName, planName);
    for (int i = 0; i < qs.size; i++) {
      String id = qs.docs[i].id;
      idsList.add(id);
    }

    return idsList;
  }

  deletePlanExpense(String? id) async {
    await databaseConnection.deleteExpensePlan(id);
  }
}
