import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/plans/update_plan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

@RoutePage()
class UpdatePlan extends StatefulWidget {
  final String? id;
  const UpdatePlan({super.key, this.id});

  @override
  State<UpdatePlan> createState() => _UpdatePlanState();
}

class _UpdatePlanState extends State<UpdatePlan> {
  final _key = GlobalKey<FormState>();
  final UpdatePlanViewModel _viewModel = UpdatePlanViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.setInitialValues(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Update Plan',
          style: TextStyle(
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
                            _viewModel.updatePlan(widget.id!);
                            Toast.show(
                              'Plan updated Successfully',
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0),
                              duration: 3,
                            );
                            context.router.back();
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
                            "Update Plan",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
