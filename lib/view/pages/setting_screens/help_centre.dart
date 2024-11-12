import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HelpCentre extends StatefulWidget {
  const HelpCentre({super.key});

  @override
  State<HelpCentre> createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  Future<bool> requestSmsPermission() async {
    var status = await Permission.sms.status;

    if (status.isProvisional || status.isDenied) {
      var result = await [Permission.sms].request();

      if (result[Permission.sms] == PermissionStatus.granted) {
        print('SMS permission granted');
        return true;
      } else if (result[Permission.sms] == PermissionStatus.denied) {
        print('SMS permission denied');
        // Handle the case where the user denies the permission.
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      print('SMS permission permanently denied');
      return false;
    }

    return true;
  }

  Future<void> sendSms(String msg, String phone) async {
    bool hasSmsPermission = await requestSmsPermission();

    if (hasSmsPermission) {
      final _text = 'sms:$phone?body=$msg';
      if (await canLaunch(_text)) {
        await launch(_text);
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Permission Denied',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            content: const Text('SMS permission is required to send messages.',
                style: TextStyle(fontFamily: 'Poppins')),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.router.back();
                },
                child: const Text('Exit'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<bool> requestPhoneCallPermission() async {
    var status = await Permission.phone.status;

    if (status.isProvisional || status.isDenied) {
      var result = await [Permission.phone].request();

      if (result[Permission.phone] == PermissionStatus.granted) {
        print('Phone call permission granted');
        return true;
      } else if (result[Permission.phone] == PermissionStatus.denied) {
        print('Phone call permission denied');
        // Handle the case where the user denies the permission.
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      print('Phone call permission permanently denied');
      // Handle the case where the user permanently denies the permission.
      return false;
    }

    // If the permission is already granted, return true
    return true;
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    bool hasPhoneCallPermission = await requestPhoneCallPermission();

    if (hasPhoneCallPermission) {
      final _phoneCallUri = 'tel:$phoneNumber';
      if (await canLaunch(_phoneCallUri)) {
        await launch(_phoneCallUri);
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permission Denied'),
            content: Text('Phone call permission is required to make calls.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('Exit'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help Center",
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
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.3
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.2
                  : ResponsiveBreakpoints.of(context).screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Expense Tracker Help Centre',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        makePhoneCall('9360227091');
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.red,
                      )),
                  title: const Text(
                    'Tap this button to make a call and our executive will reach you based on your requirements',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        sendSms('Requesting Help...', '9360227091');
                      },
                      icon: const Icon(
                        Icons.messenger_outline,
                        color: Colors.blue,
                      )),
                  title: const Text(
                    'Tap this button to make a text message and our executive will reach you based on your requirements',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        sendEmail();
                      },
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.green,
                      )),
                  title: const Text(
                    'Feel free to mail us via "support@expensetracker.com"',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendEmail() async {
    var url = Uri.parse("mailto:sanjayganesh3003@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
