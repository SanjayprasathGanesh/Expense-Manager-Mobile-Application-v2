import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../controller/local_storage_controller.dart';
import '../../database/database_connection.dart';
import '../../model/leave_tracker/leave_model.dart';

class LeaveAnalyticsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  var ttlDays = 0.obs;
  var functionLeaves = 0.obs;
  var outingLeaves = 0.obs;
  var personalLeaves = 0.obs;
  var emergencyLeaves = 0.obs;
  var sickLeaves = 0.obs;
  var paidLeaves = 0.obs;
  var others = 0.obs;

  Widget showPieForLeaveAnalytics(BuildContext context, String year) {
    return FutureBuilder(
      future: _calculatePieChartForLeaveAnalytics(year, context),
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

  Future<Widget> _calculatePieChartForLeaveAnalytics(
      String year, BuildContext context) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    QuerySnapshot querySnapshot =
        await databaseConnection.getLeavesForAnalytics(uName);
    int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0, n6 = 0, n7 = 0, total = 0;
    for (int i = 0; i < querySnapshot.size; i++) {
      Map<String, dynamic> json =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      Leave leave = Leave.fromJson(json);

      String leaveType = leave.leaveType!;
      String s = leave.month!;
      String year2 = s.split(',')[1];

      if (year2 == year) {
        if (leaveType == 'Function') {
          n1++;
        } else if (leaveType == 'Outing') {
          n2++;
        } else if (leaveType == 'Personal Reason') {
          n3++;
        } else if (leaveType == 'Emergency Leave') {
          n4++;
        } else if (leaveType == 'Sick Leave') {
          n5++;
        } else if (leaveType == 'Paid Leave') {
          n6++;
        } else if (leaveType == 'Others') {
          n7++;
        }
      }
    }
    functionLeaves.value = n1;
    outingLeaves.value = n2;
    personalLeaves.value = n3;
    emergencyLeaves.value = n4;
    sickLeaves.value = n5;
    paidLeaves.value = n6;
    others.value = n7;
    ttlDays.value = (n1 + n2 + n3 + n4 + n5 + n6 + n7);

    List<Color> colorList1 = [
      const Color(0xFF52b788),
      const Color(0xFFef6351),
      const Color(0xFF219ebc),
      const Color(0xFFffaa00),
      const Color(0xFFffafcc),
      const Color(0xFFcdb4db),
      const Color(0xFF582f0e),
    ];

    Map<String, double> dataMap1 = {
      "Function Leaves": n1.toDouble(),
      "Outing Leaves": n2.toDouble(),
      "Personal Leaves": n3.toDouble(),
      "Emergency Leave": n4.toDouble(),
      "Sick Leave": n5.toDouble(),
      "Paid Leave": n6.toDouble(),
      "Others": n7.toDouble(),
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
            child: const Text(
              "No Leave Records has been registered in this year",
              textAlign: TextAlign.center,
              style: TextStyle(
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
      centerText: "Leave Analytics",
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
