import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../view_model/expenses/view_all_expenses_view_model.dart';

@RoutePage()
class MyExpenses extends StatefulWidget {
  const MyExpenses({super.key});

  @override
  State<MyExpenses> createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  final MyExpensesViewModel _expensesViewModel = MyExpensesViewModel();
  RxBool isLoaded = false.obs;

  List<String> idsList = [];

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

  @override
  void initState() {
    super.initState();
    getIds();
  }

  Future<void> getIds() async {
    idsList = await _expensesViewModel.getAllExpensesId(months[m], year.toString());
    setState(() {
      isLoaded.value = true;
    });
    if (kDebugMode) {
      print("Loaded idsList: $idsList");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        automaticallyImplyLeading: false,
        title: Text(
          '${months[m]} $year Month Expenses',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFf7ede2),
      body: Center(
        child: Container(
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
          child: FutureBuilder(
            future:
                _expensesViewModel.getAllExpenses(months[m], year.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.hasData) {
                  final expenses = snapshot.data;
                  if (expenses!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 250,
                                child: Image.asset(
                                  'images/empty_expense.jpg',
                                  fit: BoxFit.fitHeight,
                                )),
                            const Text(
                              'Empty Expenses found in this month',
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
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.router
                                        .push(UpdateExpense(id: idsList[index]))
                                        .then((value) {
                                      setState(() {
                                        _expensesViewModel.getAllExpenses(
                                            months[m], year.toString());
                                      });
                                    });
                                  },
                                  icon: Icons.edit_note_sharp,
                                  backgroundColor: Colors.green,
                                  label: 'Update',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    deleteExpense(idsList[index]);
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                ),
                              ]),
                          child: ListTile(
                              title: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        expenses[index].expenseDate!,
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
                                        '₹ ${expenses[index].expenseAmt!.toString()}',
                                        style: const TextStyle(
                                          color: Colors.black,
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
                                        expenses[index].expenseName!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
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
                                        expenses[index].expenseType!,
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
                                        expenses[index].expenseTrans!,
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
                                  Center(
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      color: Colors.green,
                                      onPressed: () {
                                        if (expenses[index].expenseImg !=
                                            null) {
                                          viewBill(
                                              context,
                                              expenses[index].expenseImg!,
                                              expenses[index].expenseName!);
                                        } else {
                                          showNoBillImageDialog();
                                        }
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            'View Bill',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/empty_expense.jpg'),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFffb700),
        onPressed: () {
          selectMonth(context);
          print(idsList.length);
          setState(() {
            getIds();
          });
          print(idsList.length);
        },
        child: const Icon(
          Icons.filter_alt_sharp,
          color: Colors.black,
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${months[m]} Month Total Expense',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Obx(() => Text(
                  '₹ ${_expensesViewModel.ttlExpense.value}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )),
          ],
        )
      ],
    );
  }

  deleteExpense(String id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do you want to delete this Expense',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: 'Poppins',
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.green,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _expensesViewModel.deleteExpense(id);
                      setState(() {
                        _expensesViewModel.getAllExpenses(
                            months[m], year.toString());
                        _expensesViewModel.getAllExpensesId(
                            months[m], year.toString());
                      });
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
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
        _expensesViewModel.getAllExpenses(months[m], year.toString());
        _expensesViewModel.getAllExpensesId(months[m], year.toString());
        getIds();
      });
    }
  }

  Future<void> viewBill(BuildContext context, String? img, String expenseName) {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: Text('Bill for $expenseName'),
          content: SizedBox(
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
            height: ResponsiveBreakpoints.of(context).screenHeight * 0.6,
            child: PhotoView(
              imageProvider: FileImage(File(img!)),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  showNoBillImageDialog() {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text(
            'No Bill Image Found',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
