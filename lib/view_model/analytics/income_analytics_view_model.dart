import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../controller/local_storage_controller.dart';
import '../../model/incomes/income_model.dart';

class IncomeAnalyticsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  final List<String> earningsList = ['Salary', 'Business Profit'];
  var earningsTtl = 0.obs;
  var sideTtl = 0.obs;
  var typeTtl = 0.obs;

  List<String> transList = [
    'Cash',
    'UPI',
    'Credit Card',
    'Debit Card',
    'Net Banking'
  ];
  var cashTtl = 0.obs;
  var upiTtl = 0.obs;
  var creditTtl = 0.obs;
  var debitTtl = 0.obs;
  var netTtl = 0.obs;
  var chequeTtl = 0.obs;
  var ddTtl = 0.obs;
  var transTtl = 0.obs;

  Future<void> calculateIncomeWithType(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    int n1 = 0, total = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);

      String incType = incomes.incomeType!;
      int amt = incomes.incomeAmt!;

      if (earningsList.contains(incType)) {
        n1 += amt;
      }
      total += amt;
    }

    earningsTtl.value = n1;
    sideTtl.value = total - n1;
    typeTtl.value = total;
  }

  Future<void> calculateIncomeWithTrans(String month, String year) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0, n6 = 0, n7 = 0, total = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);

      String incTrans = incomes.incomeTrans!;
      int amt = incomes.incomeAmt!;

      if (incTrans == 'Cash') {
        n1 += amt;
      } else if (incTrans == 'UPI') {
        n2 += amt;
      } else if (incTrans == 'Credit Card') {
        n3 += amt;
      } else if (incTrans == 'Debit Card') {
        n4 += amt;
      } else if (incTrans == 'Net Banking') {
        n5 += amt;
      } else if (incTrans == 'Cheque') {
        n6 += amt;
      } else if (incTrans == 'Demand Draft') {
        n7 += amt;
      }
      total += amt;
    }

    cashTtl.value = n1;
    upiTtl.value = n2;
    creditTtl.value = n3;
    debitTtl.value = n4;
    netTtl.value = n5;
    chequeTtl.value = n6;
    ddTtl.value = n7;
    transTtl.value = total;
  }

  Widget showPieIncomeType(BuildContext context, String month, String year) {
    return FutureBuilder(
      future: _calculatePieChartForIncomeType(month, year, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return snapshot.data as Widget;
        }
      },
    );
  }

  Future<Widget> _calculatePieChartForIncomeType(
      String month, String year, BuildContext context) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    int n1 = 0, total = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);

      String incType = incomes.incomeType!;
      int amt = incomes.incomeAmt!;

      if (earningsList.contains(incType)) {
        n1 += amt;
      }
      total += amt;
    }

    List<Color> colorList1 = [
      const Color(0xFF52b788),
      const Color(0xFFef6351),
    ];

    Map<String, double> dataMap1 = {
      "Earning Incomes": n1.toDouble(),
      "Side Incomes": (total - n1).toDouble(),
    };

    if (n1 == 0 && (total - (n1)) == 0) {
      return Container(
        height: 200,
        margin: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'images/empty_expAnalytics.jpg',
          ),
          fit: BoxFit.fitHeight,
        )),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "No Incomes has been recorded on $month,$year Month, please check it for other months",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return PieChart(
      dataMap: dataMap1,
      colorList: colorList1,
      chartRadius: ResponsiveBreakpoints.of(context).isDesktop
          ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
          : ResponsiveBreakpoints.of(context).isTablet
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).screenWidth - 140,
      centerText: "Analytics with Income Type",
      animationDuration: const Duration(seconds: 3),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: true,
        showChartValuesOutside: true,
        showChartValuesInPercentage: true,
        showChartValueBackground: false,
      ),
      legendOptions: const LegendOptions(
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        legendPosition: LegendPosition.bottom,
        showLegendsInRow: true,
      ),
    );
  }

  Widget showPieIncomeTrans(BuildContext context, String month, String year) {
    return FutureBuilder(
      future: _calculatePieChartIncomeTrans(month, year, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return snapshot.data as Widget;
        }
      },
    );
  }

  Future<Widget> _calculatePieChartIncomeTrans(String month, String year, BuildContext context) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot =
        await databaseConnection.getAllIncomes(uName, '$month,$year');
    int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0, n6 = 0, n7 = 0, total = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Incomes incomes = Incomes.fromJson(json);

      String incTrans = incomes.incomeTrans!;
      int amt = incomes.incomeAmt!;

      if (incTrans == 'Cash') {
        n1 += amt;
      } else if (incTrans == 'UPI') {
        n2 += amt;
      } else if (incTrans == 'Credit Card') {
        n3 += amt;
      } else if (incTrans == 'Debit Card') {
        n4 += amt;
      } else if (incTrans == 'Net Banking') {
        n5 += amt;
      } else if (incTrans == 'Cheque') {
        n6 += amt;
      } else if (incTrans == 'Demand Draft') {
        n7 += amt;
      }
      total += amt;
    }

    List<Color> colorList1 = [
      const Color(0xFF38b000),
      const Color(0xFF0077b6),
      const Color(0xFFcb997e),
      const Color(0xFFdda15e),
      const Color(0xFF6b9080),
      const Color(0xFFa5a5a5),
      const Color(0xFFff82a9),
    ];

    Map<String, double> dataMap1 = {
      "Cash": n1.toDouble(),
      "UPI": n2.toDouble(),
      "Credit Card": n3.toDouble(),
      "Debit Card": n4.toDouble(),
      "Net Banking": n5.toDouble(),
      "Cheque": n6.toDouble(),
      "Demand Draft": n7.toDouble(),
    };

    if (n1 == 0 && n2 == 0 && n3 == 0 && (total - (n1 + n2 + n3)) == 0) {
      return Container(
        height: 200,
        margin: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'images/empty_expAnalytics.jpg',
          ),
          fit: BoxFit.fitHeight,
        )),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "No Incomes has been recorded on $month,$year Month, please check it for other months",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return PieChart(
      dataMap: dataMap1,
      colorList: colorList1,
      chartRadius: ResponsiveBreakpoints.of(context).isDesktop
          ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
          : ResponsiveBreakpoints.of(context).isTablet
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).screenWidth - 140,
      centerText: "Analytics with Income Transaction",
      animationDuration: const Duration(seconds: 3),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: true,
        showChartValuesOutside: true,
        showChartValuesInPercentage: true,
        showChartValueBackground: false,
      ),
      legendOptions: const LegendOptions(
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        legendPosition: LegendPosition.bottom,
        showLegendsInRow: true,
      ),
    );
  }
}
