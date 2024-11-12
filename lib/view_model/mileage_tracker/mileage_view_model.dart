import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/mileage_tracker/mileage_model.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class MileageViewModel extends GetxController {
  final DatabaseConnection databaseConnection = DatabaseConnection();

  Future<List<Mileage>> getAllMileage() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Mileage> list = <Mileage>[];

    QuerySnapshot querySnapshot = await databaseConnection.getAllMileage(uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> map =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Mileage mileage = Mileage.fromJson(map);
      list.add(mileage);
    }

    return list;
  }

  Future<List<String>> getAllMileageId() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> list = <String>[];

    QuerySnapshot querySnapshot = await databaseConnection.getAllMileage(uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      String id = querySnapshot.docs[i].id;
      list.add(id);
    }

    return list;
  }

  deleteMileage(String id) async {
    await databaseConnection.deleteMileage(id);
  }
}
