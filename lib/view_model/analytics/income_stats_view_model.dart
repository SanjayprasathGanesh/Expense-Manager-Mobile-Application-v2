import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';
import '../../database/database_connection.dart';
import '../../model/incomes/income_model.dart';

class IncomesStatsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  var ttlByName = 0.obs;
  var ttlByAmt = 0.obs;
  var ttlByDate = 0.obs;
  var ttlByType = 0.obs;
  var ttlByTrans = 0.obs;

  Future<List<Incomes>> getIncomeByName(String? name) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Incomes> incomesList = <Incomes>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getIncomeByName(name!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);
      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlByName.value = amt;
    return incomesList;
  }

  Future<List<Incomes>> getIncomeByDate(String? date) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Incomes> incomesList = <Incomes>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getIncomeByDate(date!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);
      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlByDate.value = amt;
    return incomesList;
  }

  Future<List<Incomes>> getIncomeByAmt(int? amount) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Incomes> incomesList = <Incomes>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getIncomeByAmount(amount!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);
      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlByAmt.value = amt;
    return incomesList;
  }

  Future<List<Incomes>> getIncomeByType(String? type) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Incomes> incomesList = <Incomes>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getIncomeByType(type!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);
      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlByType.value = amt;
    return incomesList;
  }

  Future<List<Incomes>> getIncomeByTrans(String? trans) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Incomes> incomesList = <Incomes>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getIncomeByTrans(trans!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);
      amt += incomes.incomeAmt!;
      incomesList.add(incomes);
    }
    ttlByTrans.value = amt;
    return incomesList;
  }
}
