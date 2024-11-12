import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';
import '../../model/expenses/expense_model.dart';

class MyExpensesViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  final ttlExpense = 0.obs;

  Future<List<Expense>> getAllExpenses(String month, String year) async {
    ttlExpense.value = 0;
    List<Expense> expenseList = <Expense>[];

    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot qs = await databaseConnection.getAllExpenses(uName,'$month,$year');
    int amt = 0;
    for (int i = 0; i < qs.size; i++) {
      Map<String, dynamic> map = qs.docs[i].data() as Map<String, dynamic>;
      Expense expense = Expense.fromJson(map);
      amt += expense.expenseAmt!;
      expenseList.add(expense);
    }
    ttlExpense.value = amt;
    return expenseList;
  }

  Future<List<String>> getAllExpensesId(String month, String year) async {
    List<String> idsList = <String>[];
    final LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();
    QuerySnapshot qs = await databaseConnection.getAllExpenses(uName, '$month,$year');
    for (int i = 0; i < qs.size; i++) {
      String id = qs.docs[i].id;
      idsList.add(id);
    }
    return idsList;
  }

  deleteExpense(String id) async {
    await databaseConnection.deleteExpense(id);
  }
}
