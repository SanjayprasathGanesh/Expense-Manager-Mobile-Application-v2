import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/expenses/expense_model.dart';
import 'package:expense_manager/model/incomes/income_model.dart';
import 'package:get/get.dart';
import '../../controller/local_storage_controller.dart';

class YearAnalyticsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  var ttlExp = 0.obs;
  var ttlInc = 0.obs;

  Future<List<YearAnalytics>> getAnalyticsRecords(String yearParam) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    List<YearAnalytics> yearAnalyticsList = [];
    List<String> monthsList = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    int year = int.parse(yearParam);

    // Fetch income data for the year
    QuerySnapshot incomeSnapshot = await databaseConnection.getIncomeForYear(uName);

    Map<String, int> incomeMap = {};
    for (int i = 0; i < incomeSnapshot.size; i++) {
      Map<String, dynamic> json =
          incomeSnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes income = Incomes.fromJson(json);

      String? m = income.month?.split(',')[0];
      String? y = income.month?.split(',')[1];

      if (year.toString() == y) {
        int? amount = income.incomeAmt;
        ttlInc.value += amount!;
        incomeMap[m!] = amount!;
      }
    }

    // Fetch expense data for the year
    QuerySnapshot expenseSnapshot = await databaseConnection.getExpenseForYear(uName);

    for (String month in monthsList) {
      int expCount = 0;
      int expTtl = 0;
      int incTtl = incomeMap[month] ?? 0;

      for (DocumentSnapshot doc in expenseSnapshot.docs) {
        Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
        Expense expense = Expense.fromJson(json);

        String? m = expense.month?.split(',')[0];
        String? y = expense.month?.split(',')[1];

        if (m == month && y == year.toString()) {
          expCount++;
          expTtl += expense.expenseAmt!;
          ttlExp.value = expTtl;
        }
      }

      YearAnalytics yearAnalytics = YearAnalytics(
        month: month,
        year: year.toString(),
        expCount: expCount,
        incTtl: incTtl,
        expTtl: expTtl,
        balance: incTtl - expTtl,
        status: getStatus(incTtl - expTtl),
      );

      yearAnalyticsList.add(yearAnalytics);
    }

    return yearAnalyticsList;
  }

  String getStatus(int balance) {
    if (balance == 0) {
      return 'Balanced';
    }
    return balance > 0 ? 'Profit' : 'Loss';
  }
}

class YearAnalytics {
  String? month;
  String? year;
  int? expCount;
  int? incTtl;
  int? expTtl;
  int? balance;
  String? status;

  YearAnalytics({
    required this.month,
    required this.year,
    required this.expCount,
    required this.incTtl,
    required this.expTtl,
    required this.balance,
    required this.status,
  });
}
