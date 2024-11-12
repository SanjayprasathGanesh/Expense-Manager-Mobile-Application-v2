import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/setting_screen_view_model/contact_us_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

@RoutePage()
class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _key = GlobalKey<FormState>();
  final ContactUsViewModel _viewModel = ContactUsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Contact Us',
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
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.3
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
                            _viewModel.sendFeedback();
                            Toast.show(
                              'New Plan added Successfully',
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0),
                              duration: 3,
                            );
                            context.router.push(const ContactSubmitted());
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
                            "Send Feedback",
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
