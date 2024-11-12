import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'auth_service.dart';

class AuthGuard extends AutoRouteGuard {
  // AuthService authService = AuthService();
  // AuthGuard(){
  //   Get.find<AuthService>();
  // }
  // final AuthService authService = Get.find<AuthService>();
  //
  // @override
  // Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
  //   final isLoggedIn = authService.isLoggedIn.value;
  //   print('Bool : $isLoggedIn');
  //   if (isLoggedIn) {
  //     print('Yes');
  //     authService.login();
  //     resolver.next();
  //   } else {
  //     print('No');
  //     resolver.redirect(const UserSignup());
  //   }
  // }

  final AuthService authService = Get.find<AuthService>();
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    bool isLoggedIn = authService.getLoggedIn();

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      // resolver.redirect(UserSignup(onResult: (result) async {
      //   if (result == true) {
      //     router.removeUntil((route) => route.name == UserSignup.name);
      //     print('True');
      //     resolver.next();
      //   } else {
      //     print('False');
      //     Toast.show('Result is False');
      //   }
      // }));
      resolver.redirect(const UserLogin());
    }
  }
}
