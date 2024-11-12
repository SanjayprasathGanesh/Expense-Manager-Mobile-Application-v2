import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/mygarage/accessories_model.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';

class MyAccessoriesViewModel extends GetxController {
  final DatabaseConnection databaseConnection = DatabaseConnection();
  final ttlAmt = 0.0.obs;
  final items = 0.obs;

  Future<List<Accessories>> getAccessoriesForVehicle(String vehicleName) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Accessories> list = <Accessories>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAccessoriesForVehicles(uName, vehicleName);
    double amt = 0.0;
    int count = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> map =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Accessories accessories = Accessories.fromJson(map);
      amt += accessories.price!;
      count++;
      list.add(accessories);
    }
    ttlAmt.value = amt;
    items.value = count;

    return list;
  }

  Future<List<String>> getAccessoriesId(String vehicleName) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> list = <String>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAccessoriesForVehicles(uName, vehicleName);
    for (int i = 0; i < querySnapshot.size; i++) {
      String id = querySnapshot.docs[i].id;
      list.add(id);
    }

    return list;
  }

  deleteAccessory(String id) async {
    await databaseConnection.deleteAccessory(id);
  }
}
