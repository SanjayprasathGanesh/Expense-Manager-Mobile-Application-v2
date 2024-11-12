import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';
import '../../../../view_model/leave_tracker/add_leave_view_model.dart';

@RoutePage()
class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  final AddLeaveViewModel _viewModel = AddLeaveViewModel();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Add Personal Leave',
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
                          _viewModel.addLeave();
                          Toast.show('Leave Added Successfully',
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
