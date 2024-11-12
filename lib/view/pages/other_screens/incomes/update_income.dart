import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../../view_model/incomes/update_income_view_model.dart';

@RoutePage()
class UpdateIncome extends StatefulWidget {
  final String? id;
  const UpdateIncome({super.key, this.id});

  @override
  State<UpdateIncome> createState() => _UpdateIncomeState();
}

class _UpdateIncomeState extends State<UpdateIncome> {
  final _key = GlobalKey<FormState>();
  final UpdateIncomeViewModel _incomeViewModel = UpdateIncomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incomeViewModel.setInitialValues(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Update Income',
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
                    _incomeViewModel.buildForms(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            ToastContext().init(context);
                            if (_key.currentState!.validate()) {
                              _incomeViewModel.updateIncome(widget.id);
                              Toast.show(
                                'Income updated Successfully',
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
                              "Update Income",
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
