import 'package:expense_manager/auto_route/app_routes.dart';
import 'package:expense_manager/auto_route/auth_service.dart';
import 'package:expense_manager/controller/image_controller.dart';
import 'package:expense_manager/controller/username_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC7X1gysaoqV_smBnWvoJW2LEjtre8CqdU",
          authDomain: "expensetracker-af4e1.firebaseapp.com",
          projectId: "expensetracker-af4e1",
          storageBucket: "expensetracker-af4e1.appspot.com",
          messagingSenderId: "1004254650587",
          appId: "1:1004254650587:web:29013979ab25e2558cecfe",
          measurementId: "G-TGJWV4336Y"));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(ImageController());
  Get.put(UsernameController());
  // Get.put(AuthService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    AppRouter appRoutes = AppRouter();
    Get.put(ImageController());
    Get.put(UsernameController());
    Get.put(AuthService());
    ToastContext().init(context);
    return MaterialApp.router(
      routerConfig: appRoutes.config(
        reevaluateListenable: authService,
      ),
      builder: (context, child) => ResponsiveBreakpoints(breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4k')
      ], child: child!),
      debugShowCheckedModeBanner: false,
    );
  }
}
