import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/controller/local_storage_controller.dart';
import 'package:expense_manager/database/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';
import '../../../auto_route/auth_service.dart';
import '../../../view_model/users/pagesList.dart';
import '../../widgets/custom_drawer.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
            ? showCustomWebAppBar()
            : AppBar(
                backgroundColor: const Color(0xFFffb700),
                automaticallyImplyLeading: false,
                title: const Text(
                  'Expense Tracker',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context)
                            .openDrawer(); // Use Scaffold.of(context) here
                      },
                    );
                  },
                ),
                actions: [
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                    offset: const Offset(0, 50),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.logout_outlined),
                            title: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            onTap: () {
                              logout(context);
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.exit_to_app),
                            title: const Text(
                              'Sign out',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            onTap: () {
                              deleteAccount(context);
                            },
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        bottomNavigationBar:
            ResponsiveBreakpoints.of(context).isMobile ? showBottomBar() : null,
        body: pages[index],
      ),
    );
  }

  showBottomBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFc36f09),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(5.0),
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  color: index != 0 ? Colors.black : Colors.yellow,
                ),
                iconSize: 25.0,
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: index == 0 ? Colors.amber : Colors.black,
                  fontSize: 11.0,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: index != 1 ? Colors.black : Colors.yellow,
                  )),
              Text(
                "Expenses",
                style: TextStyle(
                  color: index == 1 ? Colors.amber : Colors.black,
                  fontSize: 11.0,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  icon: Icon(
                    Icons.person_pin,
                    color: index != 2 ? Colors.black : Colors.yellow,
                  )),
              Text(
                "Personal",
                style: TextStyle(
                  color: index == 2 ? Colors.amber : Colors.black,
                  fontSize: 11.0,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  icon: Icon(
                    Icons.analytics_outlined,
                    color: index != 3 ? Colors.black : Colors.yellow,
                  )),
              Text(
                "Analytics",
                style: TextStyle(
                  color: index == 3 ? Colors.amber : Colors.black,
                  fontSize: 11.0,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 4;
                    });
                  },
                  icon: Icon(
                    Icons.settings,
                    color: index != 4 ? Colors.black : Colors.yellow,
                  )),
              Text(
                "Settings",
                style: TextStyle(
                  color: index == 4 ? Colors.amber : Colors.black,
                  fontSize: 11.0,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  showCustomWebAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFffb700),
      automaticallyImplyLeading: false,
      title: const Text(
        'Expense Tracker',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          fontSize: 16.0,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.ROW,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowSpacing: 20.0,
          children: [
            ResponsiveRowColumnItem(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: index == 0
                  ? const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    )
                  : const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
            )),
            const ResponsiveRowColumnItem(
                child: SizedBox(
              width: 20.0,
            )),
            ResponsiveRowColumnItem(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: index == 1
                  ? const Text(
                      'Expenses',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    )
                  : const Text(
                      'Expenses',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
            )),
            const ResponsiveRowColumnItem(
                child: SizedBox(
              width: 20.0,
            )),
            ResponsiveRowColumnItem(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                });
                // context.router.push(const Personal());
              },
              child: index == 2
                  ? const Text(
                      'Personal',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    )
                  : const Text(
                      'Personal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
            )),
            const ResponsiveRowColumnItem(
                child: SizedBox(
              width: 20.0,
            )),
            ResponsiveRowColumnItem(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 3;
                });
                // context.router.push(const Analytics());
              },
              child: index == 3
                  ? const Text(
                      'Analytics',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    )
                  : const Text(
                      'Analytics',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
            )),
            const ResponsiveRowColumnItem(
                child: SizedBox(
              width: 20.0,
            )),
            ResponsiveRowColumnItem(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 4;
                });
                // context.router.push(const Settings());
              },
              child: index == 4
                  ? const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    )
                  : const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
            )),
            const ResponsiveRowColumnItem(
                child: SizedBox(
              width: 20.0,
            )),
            ResponsiveRowColumnItem(
              child: PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                offset: const Offset(0, 50),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.logout_outlined),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onTap: () {
                          logout(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text(
                          'Sign out',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onTap: () {
                          deleteAccount(context);
                        },
                      ),
                    ),
                  ];
                },
              ),
            )
          ],
        )
      ],
    );
  }

  logout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do You want to Logout from this Account',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    ToastContext().init(context);
                    authService.logout();
                    context.router.popUntilRouteWithName(UserLogin.name);
                    Toast.show(
                      'Logged out Successfully',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                      ),
                      backgroundColor: Colors.yellow,
                    );
                  },
                  child: const Text(
                    'Logout',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.black),
                  )),
              const SizedBox(
                width: 15.0,
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.black),
                  ))
            ],
          );
        });
  }

  deleteAccount(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do You want to Delete this Account',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    ToastContext().init(context);
                    var result = DatabaseConnection().deleteUser();
                    final LocalLoginStorageController localStorage = LocalLoginStorageController();
                    if (result != null) {
                      authService.logout();
                      localStorage.deleteLoginCredentials();
                      context.router.popUntilRouteWithName(UserLogin.name);
                      Toast.show(
                        'Account Deleted Successfully',
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                        ),
                        backgroundColor: Colors.yellow,
                      );
                      Navigator.pop(context);
                    } else {
                      Toast.show(
                        'Account not Deleted',
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                        ),
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: const Text(
                    'Delete',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.black),
                  )),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.black),
                  ))
            ],
          );
        });
  }
}
