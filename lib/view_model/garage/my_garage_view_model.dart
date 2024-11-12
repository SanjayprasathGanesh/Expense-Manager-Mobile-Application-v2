import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/mygarage/vehicle_model.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';

class MyGarageViewModel extends GetxController {
  final DatabaseConnection databaseConnection = DatabaseConnection();

  Future<List<Vehicle>> getAllVehicles() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Vehicle> list = <Vehicle>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllVehicles(uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> map =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Vehicle vehicle = Vehicle.fromJson(map);
      list.add(vehicle);
    }

    return list;
  }

  Future<List<String>> getAllVehicleId() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> list = <String>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllVehicles(uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      String id = querySnapshot.docs[i].id;
      list.add(id);
    }

    return list;
  }

  deleteVehicle(String id) async {
    await databaseConnection.deleteVehicle(id);
  }
}
