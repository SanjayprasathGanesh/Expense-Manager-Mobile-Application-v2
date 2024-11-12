import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/incomes/update_income_view_model.dart';
import 'package:expense_manager/view_model/incomes/view_all_incomes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class MyIncomes extends StatefulWidget {
  const MyIncomes({super.key});

  @override
  State<MyIncomes> createState() => _MyIncomesState();
}

class _MyIncomesState extends State<MyIncomes> {
  final MyIncomesViewModel _incomesViewModel = MyIncomesViewModel();
  final UpdateIncomeViewModel _updateIncomeViewModel = UpdateIncomeViewModel();

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

  List<String> idsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIds();
  }

  Future<void> getIds() async {
    idsList =
        await _incomesViewModel.getAllIncomesId(months[m], year.toString());
    print("Loaded idsList: $idsList");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: Text(
          '${months[m]},$year Month Incomes',
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
            future: _incomesViewModel.getAllIncomes(months[m], year.toString()),
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
                  final incomes = snapshot.data;
                  if (incomes!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 250,
                        child: Column(
                          children: [
                            Image.asset('images/empty_income.jpg'),
                            const Text(
                              'Empty Incomes found in this month',
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
                      itemCount: incomes!.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.router
                                        .push(UpdateIncome(id: idsList[index]))
                                        .then((value) {
                                      setState(() {
                                        _incomesViewModel.getAllIncomes(
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
                                    deleteIncome(idsList[index]);
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
                                        incomes[index].incomeDate!,
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
                                        '₹ ${incomes[index].incomeAmt!.toString()}',
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
                                        incomes[index].incomeName!,
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
                                        incomes[index].incomeType!,
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
                                        incomes[index].incomeTrans!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
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
                          image: AssetImage('images/empty_income.jpg'),
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
              '${months[m]} Month Total Income',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Obx(() => Text(
                  '₹ ${_incomesViewModel.ttlIncome.value}',
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

  deleteIncome(String id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do you want to delete this Income',
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
                      _incomesViewModel.deleteIncome(id);
                      setState(() {
                        _incomesViewModel.getAllIncomes(
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
        _incomesViewModel.getAllIncomes(months[m], year.toString());
        _incomesViewModel.getAllIncomesId(months[m], year.toString());
        getIds();
      });
    }
  }
}
