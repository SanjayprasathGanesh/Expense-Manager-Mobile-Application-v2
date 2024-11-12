import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/analytics/expense_analytics_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  List<String> month = [
    '',
    'January',
    'Febraury',
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

  final ExpenseAnalyticsViewModel _viewModel = ExpenseAnalyticsViewModel();

  fetchValues() async {
    await _viewModel.getTotalIncomeAmt();
    await _viewModel.getTotalExpenseAmt();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.7
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenHeight * 1.2
                  : ResponsiveBreakpoints.of(context).screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${month[m]} Month Stats',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                Container(
                  height: 375,
                  width: double.infinity,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
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
                                    'Incomes',
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
                                        '₹ ${_viewModel.ttlInc}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
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
                                    'Expenses',
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
                                        '₹ ${_viewModel.ttlExp}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF669bbc),
                                    Color(0xFF90e0ef),
                                    Color(0xFFcaf0f8)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                            height: 150,
                            width: ResponsiveBreakpoints.of(context).isDesktop ? 400 :
                                      ResponsiveBreakpoints.of(context).isTablet ? 300 : 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Balance',
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
                                  '₹ ${_viewModel.ttlInc.value - _viewModel.ttlExp.value}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${month[m]} Month Status : ',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Obx(() => _viewModel.ttlInc.value -
                                _viewModel.ttlExp.value >
                            0
                        ? const Text(
                            'Profit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontFamily: 'Poppins',
                            ),
                          )
                        : _viewModel.ttlInc.value - _viewModel.ttlExp.value < 0
                            ? const Text(
                                'Loss',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            : const Text(
                                'Balanced',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontFamily: 'Poppins',
                                ),
                              )),
                  ],
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    leading: const Icon(
                      Icons.calendar_today,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Expenses Stats',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const ExpenseStats());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.green,
                    ),
                    title: const Text(
                      'Income Stats',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const IncomeStats());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.area_chart,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Expense Analytics',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const ExpenseAnalytics());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.bar_chart,
                      color: Colors.green,
                    ),
                    title: const Text(
                      'Income Analytics',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const IncomeAnalytics());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.table_chart_outlined,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      'Analysis Table',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const YearAnalytics());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    leading: const Icon(
                      Icons.safety_check_sharp,
                      color: Colors.purple,
                    ),
                    title: const Text(
                      'Leave Analytics',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      context.router.push(const LeaveAnalytics());
                    },
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
