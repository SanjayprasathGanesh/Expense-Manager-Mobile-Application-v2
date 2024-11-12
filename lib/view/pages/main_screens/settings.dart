import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/view/widgets/like_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DatabaseConnection databaseConnection = DatabaseConnection();
  RxInt count = 0.obs;
  RxString docId = "".obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.7
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenHeight * 1.2
                  : ResponsiveBreakpoints.of(context).screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'User Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.perm_identity,
                    color: Colors.deepOrange,
                  ),
                  onTap: () {
                    context.router.push(const UserProfile());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'Cards',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.card_giftcard_outlined,
                    color: Colors.pinkAccent,
                  ),
                  onTap: () {
                    context.router.push(const GiftVoucher());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'FAQ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.help_outline,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    context.router.push(const FAQ());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.contact_mail_outlined,
                    color: Colors.green,
                  ),
                  onTap: () {
                    context.router.push(const ContactUs());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'About Us',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.local_post_office_outlined,
                    color: Colors.purple,
                  ),
                  onTap: () {
                    context.router.push(const AboutUs());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'User Manual',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.library_books,
                    color: Colors.brown,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'Help Center',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.record_voice_over,
                    color: Colors.red,
                  ),
                  onTap: () {
                    context.router.push(const HelpCentre());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Text(
                    'Terms and Policies',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.bolt_outlined,
                    color: Colors.indigo,
                  ),
                  onTap: () {
                    context.router.push(const TermsAndConditions());
                  },
                ),
                const Divider(
                  indent: 60.0,
                  endIndent: 10.0,
                  thickness: 2.0,
                  color: Colors.black,
                ),
                kIsWeb
                    ? const SizedBox(
                        width: 250,
                        child: LikeButton(),
                      )
                    : const LikeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
