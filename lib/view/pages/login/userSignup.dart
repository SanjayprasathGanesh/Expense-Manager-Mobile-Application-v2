import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/auto_route/auth_service.dart';
import 'package:expense_manager/view_model/users/setuser_profile_view_model.dart';
import 'package:expense_manager/view_model/users/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';


@RoutePage()
class UserSignup extends StatefulWidget {
  Function(bool?) onResult;
  UserSignup({super.key, required this.onResult});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final SignupViewModel _signupViewModel = SignupViewModel();
  final _key = GlobalKey<FormState>();
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                : ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.3
                    : ResponsiveBreakpoints.of(context).screenWidth * 1.2,
            // height: ResponsiveBreakpoints.of(context).screenHeight * 1.5,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 250,
                  width: ResponsiveBreakpoints.of(context).isDesktop
                      ? 400
                      : ResponsiveBreakpoints.of(context).isTablet
                          ? 350
                          : 300,
                  child: Image.asset(
                    'images/signup.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            _signupViewModel.buildSignupForm(),
                            MaterialButton(
                              hoverColor: Colors.lime,
                              color: Colors.green,
                              onPressed: () async {
                                ToastContext().init(context);
                                if (_key.currentState!.validate()) {
                                  if (_signupViewModel.psw.text == _signupViewModel.cPsw.text) {
                                    bool check = await _signupViewModel.checkUserIdExist();
                                    if (check) {
                                      _signupViewModel.setUserCredentials();
                                      authService.login();
                                      SetUserProfileViewModel().usernameController!.setName(_signupViewModel.uName.text);
                                      SetUserProfileViewModel().usernameController!.setPsw(_signupViewModel.psw.text);

                                      Toast.show(
                                        'User Account Created Successfully',
                                        backgroundColor: Colors.green,
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0),
                                        duration: 3,
                                      );

                                      context.router.push(const SetUserProfile());
                                    } else {
                                      Toast.show(
                                          'UserId already exist, please try with another id',
                                          duration: 3,
                                          gravity: Toast.bottom,
                                          backgroundColor: Colors.red,
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                          ));
                                    }
                                  } else {
                                    Toast.show('Password Mismatched',
                                        duration: 3,
                                        gravity: Toast.bottom,
                                        backgroundColor: Colors.red,
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                        ));
                                  }
                                } else {
                                  _signupViewModel.showValidation(context);
                                  Toast.show('Provide a valid data.',
                                      duration: 3,
                                      gravity: Toast.bottom,
                                      backgroundColor: Colors.red,
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 13.0,
                                      ));
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(const UserLogin());
                  },
                  child: const Text(
                    'Existing User? Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
