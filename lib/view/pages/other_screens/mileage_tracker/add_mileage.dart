import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/mileage_tracker/add_mileage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

@RoutePage()
class AddMileage extends StatefulWidget {
  const AddMileage({super.key});

  @override
  State<AddMileage> createState() => _AddMileageState();
}

class _AddMileageState extends State<AddMileage> {
  final AddMileageViewModel _viewModel = AddMileageViewModel();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Record your Fuelling',
          style: TextStyle(
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
                    _viewModel.buildForms(),
                    MaterialButton(
                      color: Colors.green,
                      onPressed: () {
                        ToastContext().init(context);
                        if (_key.currentState!.validate()) {
                          _viewModel.addMileage();
                          Toast.show('Mileage Recorded Successfully',
                              backgroundColor: Colors.green,
                              gravity: Toast.bottom,
                              duration: 3,
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ));
                          context.router.back();
                        } else {
                          Toast.show('Empty Fields',
                              backgroundColor: Colors.red,
                              gravity: Toast.bottom,
                              duration: 3,
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ));
                        }
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
