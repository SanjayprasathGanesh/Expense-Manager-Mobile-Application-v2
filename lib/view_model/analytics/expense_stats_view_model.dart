import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';
import '../../model/expenses/expense_model.dart';

class ExpenseStatsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  var ttlByName = 0.obs;
  var ttlByAmt = 0.obs;
  var ttlByDate = 0.obs;
  var ttlByType = 0.obs;
  var ttlByTrans = 0.obs;

  Future<List<Expense>> getExpenseByName(String? name) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Expense> expenseList = <Expense>[];
    int amt = 0;

    QuerySnapshot querySnapshot = await databaseConnection.getExpenseByName(name!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json = querySnapshot.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(json);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlByName.value = amt;
    return expenseList;
  }

  Future<List<Expense>> getExpenseByDate(String? date) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Expense> expenseList = <Expense>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getExpenseByDate(date!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(json);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlByDate.value = amt;
    return expenseList;
  }

  Future<List<Expense>> getExpenseByAmt(int? amount) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Expense> expenseList = <Expense>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getExpenseByAmount(amount!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(json);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlByAmt.value = amt;
    return expenseList;
  }

  Future<List<Expense>> getExpenseByType(String? type) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Expense> expenseList = <Expense>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getExpenseByType(type!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(json);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlByType.value = amt;
    return expenseList;
  }

  Future<List<Expense>> getExpenseByTrans(String? trans) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<Expense> expenseList = <Expense>[];
    int amt = 0;

    QuerySnapshot querySnapshot =
        await databaseConnection.getExpenseByTrans(trans!, uName);
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(json);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlByTrans.value = amt;
    return expenseList;
  }
}
