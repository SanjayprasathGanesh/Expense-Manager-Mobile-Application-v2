import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';
import '../../model/incomes/income_model.dart';

class MyIncomesViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  final ttlIncome = 0.obs;

  Future<List<Incomes>> getAllIncomes(String month, String year) async {
    ttlIncome.value = 0;
    List<Incomes> incomesList = <Incomes>[];

    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot qs =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    int amt = 0;
    for (int i = 0; i < qs.size; i++) {
      Map<String, dynamic> map = qs.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(map);

      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlIncome.value = amt;
    return incomesList;
  }

  Future<List<String>> getAllIncomesId(String month, String year) async {
    List<String> idsList = <String>[];

    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot qs =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    for (int i = 0; i < qs.size; i++) {
      String id = qs.docs[i].id;
      idsList.add(id);
    }
    return idsList;
  }

  deleteIncome(String id) async {
    await databaseConnection.deleteIncome(id);
  }
}
