import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:expense_manager/view_model/analytics/expense_stats_view_model.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../widgets/date_picker.dart';

@RoutePage()
class ExpenseStats extends StatefulWidget {
  const ExpenseStats({super.key});

  @override
  State<ExpenseStats> createState() => _ExpenseStatsState();
}

class _ExpenseStatsState extends State<ExpenseStats> {
  String selected = '';
  String search = '';

  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();
  Rx<TextEditingController> type = TextEditingController().obs;
  Rx<TextEditingController> trans = TextEditingController().obs;

  List<String> expenseTypeList = [
    'Food',
    'Hotel Food',
    'Online Food Order',
    'Snacks',
    'Fuel',
    'Maintenance',
    'Fruits & Vegetables',
    'Groceries',
    'Dairy Products',
    'Provisional Items',
    'Health Care',
    'Stationary',
    'Fees',
    'Studies',
    'Clothes',
    'Rent',
    'Service',
    'Insurance',
    'Tax',
    'EMI',
    'Phone Recharge',
    'WIFI',
    'Electricity Bill',
    'Water Bill',
    'Cable Bill',
    'Gas Bill',
    'Maid Salary',
    'Beauty & Parlour',
    'Cosmetics',
    'Pooja Items',
    'Donation',
    'Subscription',
    'Appliances',
    'Gadgets',
    'Online Shopping',
    'Travelling fare',
    'Taxi Fare',
    'Personal',
    'Emergency',
    'Pharmacy Products',
    'Hospital Fare',
    'Others'
  ];
  List<String> expenseTransList = [
    'Cash',
    'Credit Card',
    'Debit Card',
    'UPI',
    'Net Banking'
  ];

  final ExpenseStatsViewModel _viewModel = ExpenseStatsViewModel();

  Widget formForDate() {
    return Row(
      children: [
        Expanded(
          child: MyDatePicker(
              title: 'Select the Expense Date',
              firstDate: DateTime(DateTime.now().year - 10),
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
              validator:
                  ValidationBuilder(requiredMessage: 'Empty Expense Date')
                      .build(),
              controller: date),
        ),
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25.0,
          child: IconButton(
              onPressed: () {
                setState(() {
                  search = 'Date';
                });
                if (date.text.isEmpty) {
                  ToastContext().init(context);
                  Toast.show('Empty Date Field',
                      duration: 3,
                      backgroundColor: Colors.red,
                      gravity: Toast.bottom,
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black));
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        )
      ],
    );
  }

  Widget formForAmount() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: amount,
            title: 'Enter the Amount',
            showIcon: false,
            showPsw: false,
            textInputType: TextInputType.number,
            readOnly: false,
            validator: ValidationBuilder(requiredMessage: 'Empty Amount Field')
                .build(),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25.0,
          child: IconButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  search = 'Amount';
                });
                if (amount.text.isEmpty) {
                  ToastContext().init(context);
                  Toast.show('Empty Amount Field',
                      duration: 3,
                      backgroundColor: Colors.red,
                      gravity: Toast.bottom,
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black));
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        )
      ],
    );
  }

  Widget formForName() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: name,
            title: 'Enter the Expense Name',
            showIcon: false,
            showPsw: false,
            textInputType: TextInputType.text,
            readOnly: false,
            validator:
                ValidationBuilder(requiredMessage: 'Empty Expense Name Field')
                    .build(),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25.0,
          child: IconButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  search = 'Name';
                });
                if (name.text.isEmpty) {
                  ToastContext().init(context);
                  Toast.show('Empty Expense Name Field',
                      duration: 3,
                      backgroundColor: Colors.red,
                      gravity: Toast.bottom,
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black));
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        )
      ],
    );
  }

  // Widget formForType() {
  //   return Row(
  //     children: [
  //       Expanded(
  //           child: MyDropDown(
  //               list: expenseTypeList,
  //               onChanged: (String? value) {
  //                 type.value.text = value!;
  //               },
  //               value: expenseTypeList[0])),
  //       const SizedBox(
  //         width: 10.0,
  //       ),
  //       CircleAvatar(
  //         backgroundColor: Colors.green,
  //         radius: 25.0,
  //         child: IconButton(
  //             color: Colors.green,
  //             onPressed: () {
  //               setState(() {
  //                 search = 'Type';
  //               });
  //               if(type.value.text.isEmpty){
  //                 ToastContext().init(context);
  //                 Toast.show('Empty Expense Type Field',duration: 3,backgroundColor: Colors.red,gravity: Toast.bottom,textStyle: const TextStyle(fontFamily: 'Poppins',color: Colors.black));
  //               }
  //             },
  //             icon: const Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             )),
  //       )
  //     ],
  //   );
  // }
  //
  // Widget formForTrans() {
  //   return Row(
  //     children: [
  //       Expanded(
  //           child: MyDropDown(
  //               list: expenseTransList,
  //               onChanged: (String? value) {
  //                 trans.value.text = value!;
  //               },
  //               value: expenseTransList[0])),
  //       const SizedBox(
  //         width: 10.0,
  //       ),
  //       CircleAvatar(
  //         backgroundColor: Colors.green,
  //         radius: 25.0,
  //         child: IconButton(
  //             color: Colors.green,
  //             onPressed: () {
  //               setState(() {
  //                 search = 'Transaction';
  //               });
  //               if(trans.value.text.isEmpty){
  //                 ToastContext().init(context);
  //                 Toast.show('Empty Transaction Field',duration: 3,backgroundColor: Colors.red,gravity: Toast.bottom,textStyle: const TextStyle(fontFamily: 'Poppins',color: Colors.black));
  //               }
  //             },
  //             icon: const Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             )),
  //       )
  //     ],
  //   );
  // }

  Widget formForType() {
    return Row(
      children: [
        Expanded(
          child: MyDropDown(
            list: expenseTypeList,
            onChanged: (String? value) {
              type.value.text = value!;
            },
            value: type.value.text.isNotEmpty
                ? type.value.text
                : expenseTypeList[
                    0], // Use the value or default to the first item
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25.0,
          child: IconButton(
            color: Colors.green,
            onPressed: () {
              if (type.value.text.isEmpty) {
                ToastContext().init(context);
                Toast.show('Empty Expense Type Field',
                    duration: 3,
                    backgroundColor: Colors.red,
                    gravity: Toast.bottom,
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins', color: Colors.black));
              } else {
                setState(() {
                  search = 'Type';
                });
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget formForTrans() {
    return Row(
      children: [
        Expanded(
          child: MyDropDown(
            list: expenseTransList,
            onChanged: (String? value) {
              trans.value.text = value!;
            },
            value: trans.value.text.isNotEmpty
                ? trans.value.text
                : expenseTransList[
                    0], // Use the value or default to the first item
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25.0,
          child: IconButton(
            color: Colors.green,
            onPressed: () {
              if (trans.value.text.isEmpty) {
                ToastContext().init(context);
                Toast.show('Empty Transaction Field',
                    duration: 3,
                    backgroundColor: Colors.red,
                    gravity: Toast.bottom,
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins', color: Colors.black));
              } else {
                setState(() {
                  search = 'Transaction';
                });
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  void resetValues() {
    if (selected == 'Type') {
      type.value.text = expenseTypeList[0];
    } else if (selected == 'Transaction') {
      trans.value.text = expenseTransList[0];
    } else {
      type.value.text = '';
      trans.value.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Expense Stats',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(6.0),
                width: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
                    : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                        : ResponsiveBreakpoints.of(context).screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = 'Date';
                                resetValues();
                              });
                            },
                            color: selected == 'Date'
                                ? Colors.yellow
                                : Colors.grey,
                            child: const Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = 'Amount';
                                resetValues();
                              });
                            },
                            color: selected == 'Amount'
                                ? Colors.yellow
                                : Colors.grey,
                            child: const Text(
                              'Amount',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = 'Type';
                                resetValues();
                              });
                            },
                            color: selected == 'Type'
                                ? Colors.yellow
                                : Colors.grey,
                            child: const Text(
                              'Type',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = 'Transaction';
                                resetValues();
                              });
                            },
                            color: selected == 'Transaction'
                                ? Colors.yellow
                                : Colors.grey,
                            child: const Text(
                              'Transaction',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          selected = 'Name';
                          resetValues();
                        });
                      },
                      color: selected == 'Name' ? Colors.yellow : Colors.grey,
                      child: const Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    // selected == 'Name'
                    //     ? formForName()
                    //     : selected == 'Date'
                    //         ? formForDate()
                    //         : selected == 'Amount'
                    //             ? formForAmount()
                    //             : selected == 'Type'
                    //                 ? formForType()
                    //                 : selected == 'Transaction'
                    //                     ? formForTrans()
                    //                     : const SizedBox(),
                    buildForm(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(6.0),
                width: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
                    : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                        : ResponsiveBreakpoints.of(context).screenWidth,
                height: ResponsiveBreakpoints.of(context).screenHeight * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: FutureBuilder(
                  future: selected == 'Name' &&
                          search == 'Name' &&
                          name.text.isNotEmpty
                      ? _viewModel.getExpenseByName(name.text)
                      : selected == 'Date' &&
                              search == 'Date' &&
                              date.text.isNotEmpty
                          ? _viewModel.getExpenseByDate(date.text)
                          : selected == 'Amount' &&
                                  search == 'Amount' &&
                                  amount.text.isNotEmpty
                              ? _viewModel
                                  .getExpenseByAmt(int.parse(amount.text))
                              : selected == 'Type' &&
                                      search == 'Type' &&
                                      type.value.text.isNotEmpty
                                  ? _viewModel.getExpenseByType(type.value.text)
                                  : selected == 'Transaction' &&
                                          search == 'Transaction' &&
                                          trans.value.text.isNotEmpty
                                      ? _viewModel
                                          .getExpenseByTrans(trans.value.text)
                                      : null,
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
                              height: 250,
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 150,
                                      child: Image.asset(
                                        'images/empty_expense.jpg',
                                        fit: BoxFit.fitHeight,
                                      )),
                                  const Text(
                                    'Empty Expenses found in this search',
                                    textAlign: TextAlign.center,
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
                            itemCount: expenses!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
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
                                      )
                                    ],
                                  ),
                                ),
                              ));
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
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Expense Amount',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Obx(() => search == 'Name'
                ? Text(
                    '₹ ${_viewModel.ttlByName.value}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                : search == 'Date'
                    ? Text(
                        '₹ ${_viewModel.ttlByDate.value}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      )
                    : search == 'Amount'
                        ? Text(
                            '₹ ${_viewModel.ttlByAmt.value}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          )
                        : search == 'Type'
                            ? Text(
                                '₹ ${_viewModel.ttlByType.value}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                '₹ ${_viewModel.ttlByTrans.value}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ))
          ],
        )
      ],
    );
  }

  Widget buildForm() {
    switch (selected) {
      case 'Name':
        return formForName();
      case 'Date':
        return formForDate();
      case 'Amount':
        return formForAmount();
      case 'Type':
        return formForType();
      case 'Transaction':
        return formForTrans();
      default:
        return const SizedBox();
    }
  }
}
