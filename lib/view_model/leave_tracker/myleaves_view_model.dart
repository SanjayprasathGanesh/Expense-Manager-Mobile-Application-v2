import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/leave_tracker/leave_model.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class MyLeavesViewModel extends GetxController {
  final DatabaseConnection databaseConnection = DatabaseConnection();

  Future<List<Leave>> getAllLeaves(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Leave> list = <Leave>[];

    QuerySnapshot querySnapshot = await databaseConnection.getAllLeaves(uName, '$month,$year');
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> map =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Leave leave = Leave.fromJson(map);
      list.add(leave);
    }

    return list;
  }

  Future<List<String>> getAllLeaveId(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> list = <String>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllLeaves(uName, '$month,$year');
    for (int i = 0; i < querySnapshot.size; i++) {
      String id = querySnapshot.docs[i].id;
      list.add(id);
    }

    return list;
  }

  deleteLeave(String id) async {
    await databaseConnection.deleteLeave(id);
  }
}
