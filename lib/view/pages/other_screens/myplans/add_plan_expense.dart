import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/plans/add_expense_plan_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../../auto_route/app_routes.gr.dart';

@RoutePage()
class AddPlanExpense extends StatefulWidget {
  final String? planName;
  const AddPlanExpense({super.key, this.planName});

  @override
  State<AddPlanExpense> createState() => _AddPlanExpenseState();
}

class _AddPlanExpenseState extends State<AddPlanExpense> {
  final _key = GlobalKey<FormState>();
  final AddExpensePlanViewModel _viewModel = AddExpensePlanViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: Text(
          'Add Expenses for ${widget.planName} plan',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
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
                              child: _viewModel.imageController!
                                      .getImage()!
                                      .path
                                      .isNotEmpty
                                  ? kIsWeb
                                      ? Image.network(
                                          _viewModel.imageController!
                                              .getImage()!
                                              .path,
                                          fit: BoxFit.fitHeight,
                                          height: 200.0,
                                          width: 200.0,
                                        )
                                      : Image.file(
                                          _viewModel.imageController!
                                              .getImage()!,
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
                    _viewModel.buildForms(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            ToastContext().init(context);
                            if (_key.currentState!.validate()) {
                              _viewModel.addExpensePlan(widget.planName);
                              _viewModel.updatePlansExp(widget.planName);
                              Toast.show(
                                'Expense added Successfully',
                                backgroundColor: Colors.green,
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 13.0),
                                duration: 3,
                              );
                              context.router.popAndPush(
                                  PlanExpenses(planName: widget.planName));
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
                              "Add Expense",
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
