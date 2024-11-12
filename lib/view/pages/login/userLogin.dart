import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/users/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../auto_route/auth_service.dart';

@RoutePage()
class UserLogin extends StatefulWidget {
  // Function(bool?) onResult;
  // UserLogin({super.key, required this.onResult});

  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final LoginViewModel _loginViewModel = LoginViewModel();
  final _key = GlobalKey<FormState>();
  final AuthService authService = Get.find<AuthService>();

  setInitialLogin() async {
    _loginViewModel.getUserCredentials();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setInitialLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              // height: ResponsiveBreakpoints.of(context).screenHeight,
              width: ResponsiveBreakpoints.of(context).isDesktop
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                  : ResponsiveBreakpoints.of(context).isTablet
                      ? ResponsiveBreakpoints.of(context).screenWidth * 0.3
                      : ResponsiveBreakpoints.of(context).screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      'images/login.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const Column(
                      children: [
                        Text(
                          'Log In Now',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Please login to continue using our app',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                      ],
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
                              _loginViewModel.buildLoginForm(),
                              MaterialButton(
                                onPressed: () async {
                                  ToastContext().init(context);
                                  if (_key.currentState!.validate()) {
                                    bool check = await _loginViewModel.login();
                                    if (check) {
                                      authService.login();
                                      Toast.show('User logged in Successfully',
                                          duration: 3,
                                          gravity: Toast.bottom,
                                          backgroundColor: Colors.green,
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                          ));
                                      context.router.push(const MainRoute());
                                    } else {
                                      Toast.show('User not found',
                                          duration: 3,
                                          gravity: Toast.bottom,
                                          backgroundColor: Colors.red,
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                          ));
                                    }
                                  } else {
                                    Toast.show('Empty Fields',
                                        duration: 3,
                                        gravity: Toast.bottom,
                                        backgroundColor: Colors.red,
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                        ));
                                  }
                                },
                                color: Colors.green,
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Center(child: const LoadMediaIcons())
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(UserSignup(onResult: (_) {}));
                    },
                    child: const Text(
                      'New User? Signup',
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
        ));
  }
}
