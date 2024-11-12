import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/users/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserProfileViewModel _viewModel = UserProfileViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
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
                  child: Column(
                children: [
                  _viewModel.buildFields(),
                ],
              )))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFffb700),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        onPressed: () {
          context.router.push(const UpdateUserProfile()).then((value) {
            if (value == true) {
              context.router.removeLast();
              _viewModel.setInitialValues();
            }
          });
        },
        child: const Icon(
          Icons.update,
          color: Colors.black,
        ),
      ),
    );
  }
}
