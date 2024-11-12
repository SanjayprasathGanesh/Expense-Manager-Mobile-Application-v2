import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

import '../../controller/local_storage_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String selected = '';
  String uName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCredentials();
  }

  getUserCredentials() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String name = await localStorageController.getUserName();
    setState(() {
      uName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  "Welcome User",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 13.0,
                  ),
                ),
                accountEmail: Text(
                  uName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 13.0,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.orange),
                ),
                currentAccountPictureSize: const Size.square(72.0),
                arrowColor: Colors.black,
                decoration: const BoxDecoration(
                  color: Color(0xFFffb700),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Mileage Tracker',
                style: TextStyle(
                  color: selected == 'Mileage' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Mileage'
                  ? const Icon(
                      Icons.directions_bike_sharp,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.directions_bike_sharp,
                      color: Colors.white,
                    ),
              onTap: () {
                setState(() {
                  selected = 'Mileage';
                });
                context.router.push(const MileageTracker());
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
            ListTile(
              title: Text(
                'My Garage',
                style: TextStyle(
                  color: selected == 'Garage' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Garage'
                  ? const Icon(
                      Icons.garage,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.garage,
                      color: Colors.white,
                    ),
              onTap: () {
                context.router.push(const MyGarage());
                setState(() {
                  selected = 'Garage';
                });
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
            ListTile(
              title: Text(
                'My Plans',
                style: TextStyle(
                  color: selected == 'Plans' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Plans'
                  ? const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white,
                    ),
              onTap: () {
                context.router.push(const ViewAllPlans());
                setState(() {
                  selected = 'Plans';
                });
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
            ListTile(
              title: Text(
                'Health Tracker',
                style: TextStyle(
                  color: selected == 'Health' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Health'
                  ? const Icon(
                      Icons.health_and_safety_outlined,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.health_and_safety_outlined,
                      color: Colors.white,
                    ),
              onTap: () {
                setState(() {
                  selected = 'Health';
                });
                showPremiumAlertDialog(context);
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
            ListTile(
              title: Text(
                'Remainder',
                style: TextStyle(
                  color: selected == 'Remainder' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Remainder'
                  ? const Icon(
                      Icons.alarm_add_sharp,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.alarm_add_sharp,
                      color: Colors.white,
                    ),
              onTap: () {
                setState(() {
                  selected = 'Remainder';
                });
                showPremiumAlertDialog(context);
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
            ListTile(
              title: Text(
                'Sleep Tracker',
                style: TextStyle(
                  color: selected == 'Sleep' ? Colors.orange : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              leading: selected == 'Sleep'
                  ? const Icon(
                      Icons.nightlight_round_sharp,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.nightlight_round_sharp,
                      color: Colors.white,
                    ),
              onTap: () {
                setState(() {
                  selected = 'Sleep';
                });
                showPremiumAlertDialog(context);
              },
            ),
            const Divider(
              indent: 5.0,
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }

  showPremiumAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Premium Feature',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
          ),
          content: const Text(
            'To unlock this feature, you need a premium account.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
