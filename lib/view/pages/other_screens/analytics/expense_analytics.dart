import 'package:auto_route/annotations.dart';
import 'package:expense_manager/view_model/analytics/expense_analytics_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ExpenseAnalytics extends StatefulWidget {
  const ExpenseAnalytics({super.key});

  @override
  State<ExpenseAnalytics> createState() => _ExpenseAnalyticsState();
}

class _ExpenseAnalyticsState extends State<ExpenseAnalytics> {
  List<String> months = [
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
  int m = DateTime.now().month;
  int year = DateTime.now().year;
  DateTime selectedDate = DateTime.now();

  final ExpenseAnalyticsViewModel _viewModel = ExpenseAnalyticsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.calculateExpensesWithTrans(months[m], year.toString());
    _viewModel.calculateExpensesWithType(months[m], year.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Expense Analytics',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFfefae0),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(20.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    '${months[m]} $year Month Expense Analytics',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF52b788),
                            Color(0xFFb7e4c7),
                            Color(0xFFd8f3dc)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Necessary Expenses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.nessTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFFef6351),
                            Color(0xFFf7a399),
                            Color(0xFFffe3e0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Unnecessary Expenses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.unNessTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF219ebc),
                            Color(0xFF48cae4),
                            Color(0xFFbde0fe)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Fixed Expenses Total',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.fixedTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFFffaa00),
                            Color(0xFFffd000),
                            Color(0xFFffea00)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Emergency Expenses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.emergencyTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: ResponsiveBreakpoints.of(context).isDesktop
                      ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
                      : ResponsiveBreakpoints.of(context).isTablet
                      ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                      : ResponsiveBreakpoints.of(context).screenWidth * 0.6,
                  height: ResponsiveBreakpoints.of(context).isDesktop
                      ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
                      : ResponsiveBreakpoints.of(context).isTablet
                      ? ResponsiveBreakpoints.of(context).screenHeight * 0.8
                      : ResponsiveBreakpoints.of(context).screenHeight * 0.8,
                  child: _viewModel.showPieExpenseType(
                      context, months[m], year.toString()),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF007200),
                            Color(0xFF38b000),
                            Color(0xFF9ef01a)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses By Cash',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.cashTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF023e8a),
                            Color(0xFF0077b6),
                            Color(0xFF48cae4)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses by UPI',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.upiTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFFcb997e),
                            Color(0xFFddbea9),
                            Color(0xFFffe8d6)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses By Card',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: const Expanded(
                                    child: Center(
                                      child: Text(
                                        'Credit ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Expanded(
                                    child: Center(
                                      child: Text(
                                        'Debit ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Expanded(
                                    child: Center(
                                      child: Obx(() => Text(
                                            '₹ ${_viewModel.creditTtl.value}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Expanded(
                                    child: Center(
                                      child: Obx(() => Text(
                                            '₹ ${_viewModel.debitTtl.value}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF6b9080),
                            Color(0xFFa4c3b2),
                            Color(0xFFcce3de)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses by Net Banking',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.netTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFF595959),
                            Color(0xFFa5a5a5),
                            Color(0xFFcccccc)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses By Cheque',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.chequeTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0xFFff82a9),
                            Color(0xFFff82a9),
                            Color(0xFFffc0be)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expenses by DD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Obx(() => Text(
                                  '₹ ${_viewModel.ddTtl.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: ResponsiveBreakpoints.of(context).isDesktop
                        ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
                        : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                        : ResponsiveBreakpoints.of(context).screenWidth * 0.6,
                    height: ResponsiveBreakpoints.of(context).isDesktop
                        ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
                        : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenHeight * 0.8
                        : ResponsiveBreakpoints.of(context).screenHeight * 0.8,
                  child: _viewModel.showPieExpenseTrans(
                      context, months[m], year.toString()),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFffb700),
        onPressed: () {
          selectMonth(context);
        },
        child: const Icon(
          Icons.filter_alt_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<void> selectMonth(BuildContext context) async {
    DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 1),
      headerColor: const Color(0xFFffb700),
      headerTextColor: Colors.black,
      selectedMonthBackgroundColor: const Color(0xFFffb700),
      selectedMonthTextColor: Colors.black,
      unselectedMonthTextColor: Colors.grey,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        m = picked.month;
        year = picked.year;
      });
      _viewModel.calculateExpensesWithTrans(months[m], year.toString());
      _viewModel.calculateExpensesWithType(months[m], year.toString());
      // _viewModel.showPie1(context, months[m]);
    }
  }
}
