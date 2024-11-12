import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/myplans/plan_model.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class ViewAllPlansViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  Future<List<Plans>> getAllPlans() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName() as String;

    QuerySnapshot qs = await databaseConnection.getAllPlan(uName);
    List<Plans> plansList = [];
    for (int i = 0; i < qs.size; i++) {
      Map<String, dynamic> json = qs.docs[i].data() as Map<String, dynamic>;
      Plans plans = Plans.fromJson(json);
      plansList.add(plans);
    }

    return plansList;
  }

  Future<List<String>> getAllPlansId() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot qs = await databaseConnection.getAllPlan(uName);
    List<String> idsList = [];
    for (int i = 0; i < qs.size; i++) {
      String? id = qs.docs[i].id;
      idsList.add(id);
    }

    return idsList;
  }

  deletePlan(String? id) async {
    await databaseConnection.deletePlan(id);
  }
}
