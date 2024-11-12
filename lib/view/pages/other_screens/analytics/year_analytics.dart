import 'package:auto_route/annotations.dart';
import 'package:expense_manager/view_model/analytics/year_analytics_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class YearAnalytics extends StatefulWidget {
  const YearAnalytics({super.key});

  @override
  State<YearAnalytics> createState() => _YearAnalyticsState();
}

class _YearAnalyticsState extends State<YearAnalytics> {
  final YearAnalyticsViewModel _viewModel = YearAnalyticsViewModel();
  String year = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: Text(
          '$year Year Analytics',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFfefae0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            width: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                    : ResponsiveBreakpoints.of(context).screenWidth,
            height: ResponsiveBreakpoints.of(context).screenHeight - 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: FutureBuilder(
              future: _viewModel.getAnalyticsRecords(year),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  if (snapshot.hasData) {
                    final analytics = snapshot.data;
                    if (analytics!.isEmpty) {
                      return Center(
                        child: SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              //need to change
                              SizedBox(
                                  height: 270,
                                  child: Image.asset(
                                    'images/empty_garage.png',
                                    fit: BoxFit.fitHeight,
                                  )),
                              const Text(
                                'No Vehicles found in your garage',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: analytics.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return ListTile(
                                title: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Month',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Expense Count',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Income Total',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15.0,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Expense Total',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15.0,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Balance Amount',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          }
                          return ListTile(
                              title: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        analytics[index].month!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        analytics[index].expCount!.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '₹ ${analytics[index].incTtl.toString()}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        '₹ ${analytics[index].expTtl!.toString()}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        analytics[index].status.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        '₹ ${analytics[index].balance!.toString()}',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                    }
                  } else {
                    //Need to change
                    return Center(
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/empty_garage.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectYear(context).then((value) {
            setState(() {
              _viewModel.getAnalyticsRecords(year);
            });
          });
        },
        backgroundColor: const Color(0xFFffb700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(
          Icons.filter_alt_sharp,
          color: Colors.black,
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$year Total Income',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Obx(() => Text(
                      '₹ ${_viewModel.ttlInc.value}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$year Total Expense',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Obx(() => Text(
                      '₹ ${_viewModel.ttlExp.value}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    )),
              ],
            ),
          ],
        )
      ],
    );
  }

  Future<void> _selectYear(BuildContext context) async {
    final String? pickedYear = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            'Select a Year',
            style: TextStyle(
                color: Colors.deepOrange,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          children: List.generate(
            41,
            (index) {
              final year = DateTime.now().year - 20 + index;
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, year.toString());
                },
                child: Center(
                    child: Column(
                  children: [
                    DateTime.now().year.toString() == year.toString()
                        ? Text(
                            year.toString(),
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          )
                        : Text(
                            year.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                    const Divider(
                      thickness: 2.0,
                      color: Colors.grey,
                    )
                  ],
                )),
              );
            },
          ),
        );
      },
    );

    if (pickedYear != null) {
      setState(() {
        year = pickedYear;
      });
    }
  }
}
