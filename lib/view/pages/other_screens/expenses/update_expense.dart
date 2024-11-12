import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../../auto_route/app_routes.gr.dart';
import '../../../../view_model/expenses/update_expense_view_model.dart';

@RoutePage()
class UpdateExpense extends StatefulWidget {
  final String? id;
  const UpdateExpense({super.key, this.id});

  @override
  State<UpdateExpense> createState() => _UpdateExpenseState();
}

class _UpdateExpenseState extends State<UpdateExpense> {
  final _key = GlobalKey<FormState>();
  final UpdateExpenseViewModel _expenseViewModel = UpdateExpenseViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expenseViewModel.setInitialValues(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Update Expenses',
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
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Form(
                key: _key,
                child: Column(
                  children: [
                    Obx(() {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            context.router.push(const ImageCapture());
                          },
                          child: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 80.0,
                              child: _expenseViewModel.expImg.value.isNotEmpty
                                  ? kIsWeb
                                      ? Image.network(
                                          _expenseViewModel.expImg.value,
                                          fit: BoxFit.fitHeight,
                                          height: 200.0,
                                          width: 200.0,
                                        )
                                      : Image.file(
                                          File(_expenseViewModel.expImg.value),
                                          fit: BoxFit.fitWidth,
                                          width: 200.0,
                                        )
                                  : const Icon(
                                      Icons.attach_money,
                                      size: 50.0,
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _expenseViewModel.buildForms(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            ToastContext().init(context);
                            if (_key.currentState!.validate()) {
                              _expenseViewModel.updateExpense(widget.id);
                              Toast.show(
                                'Expense updated Successfully',
                                backgroundColor: Colors.green,
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 13.0),
                                duration: 3,
                              );
                              context.router.popAndPush(const MainRoute());
                            } else {
                              Toast.show(
                                'Empty Fields',
                                backgroundColor: Colors.red,
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 13.0),
                                duration: 3,
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Update Expense",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
