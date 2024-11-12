import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/personal_diary/personal_model.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class MyDiaryViewModel extends GetxController {
  final DatabaseConnection databaseConnection = DatabaseConnection();

  Future<List<PersonalDiary>> getAllDiary(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<PersonalDiary> list = <PersonalDiary>[];

    QuerySnapshot querySnapshot = await databaseConnection.getAllDiary(uName, '$month,$year');
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> map =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      PersonalDiary personalDiary = PersonalDiary.fromJson(map);
      list.add(personalDiary);
    }

    return list;
  }

  Future<List<String>> getAllDiaryId(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<String> list = <String>[];

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllDiary(uName, '$month,$year');
    for (int i = 0; i < querySnapshot.size; i++) {
      String id = querySnapshot.docs[i].id;
      list.add(id);
    }

    return list;
  }

  deleteDiary(String id) async {
    await databaseConnection.deleteDiary(id);
  }
}
