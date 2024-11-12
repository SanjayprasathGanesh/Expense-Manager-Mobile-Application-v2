import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/users/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../view_model/users/update_user_profile_view_model.dart';

@RoutePage()
class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({super.key});

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  final UpdateUserProfileViewModel _viewModel = UpdateUserProfileViewModel();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(minutes: 1), () async {
      await _viewModel.setInitialValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update User Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFffb700),
      ),
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              width: ResponsiveBreakpoints.of(context).isDesktop
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                  : ResponsiveBreakpoints.of(context).isTablet
                      ? ResponsiveBreakpoints.of(context).screenWidth * 0.3
                      : ResponsiveBreakpoints.of(context).screenWidth,
              height: ResponsiveBreakpoints.of(context).isDesktop
                  ? ResponsiveBreakpoints.of(context).screenHeight * 1.5
                  : ResponsiveBreakpoints.of(context).isTablet
                      ? ResponsiveBreakpoints.of(context).screenHeight * 2
                      : ResponsiveBreakpoints.of(context).screenHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                  child: Form(
                key: _key,
                child: Column(
                  children: [
                    _viewModel.buildFields(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          ToastContext().init(context);
                          if (_key.currentState!.validate()) {
                            _viewModel.updateUserProfile();
                            Toast.show(
                              'User Profile updated Successfully',
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0),
                              duration: 3,
                            );
                            context.router
                                .popAndPush(const UserProfile(), result: true);
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              )))),
    );
  }
}
