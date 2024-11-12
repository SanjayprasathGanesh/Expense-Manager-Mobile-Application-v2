import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/garage/my_garage_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MyGarage extends StatefulWidget {
  const MyGarage({super.key});

  @override
  State<MyGarage> createState() => _MyGarageState();
}

class _MyGarageState extends State<MyGarage> {
  final MyGarageViewModel _viewModel = MyGarageViewModel();

  List<String> idsList = [];

  getIds() async {
    idsList = await _viewModel.getAllVehicleId();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'My Garage',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFfefae0),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: FutureBuilder(
            future: _viewModel.getAllVehicles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.hasData) {
                  final vehicles = snapshot.data;
                  if (vehicles!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            //need to change
                            SizedBox(
                                height: 270,
                                child: Image.asset(
                                  'images/empty_garage.png',
                                  fit: BoxFit.fitHeight,
                                )),
                            const Text(
                              'No Vehicles found in your garage',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: vehicles.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.router
                                        .push(UpdateVehicle(id: idsList[index]))
                                        .then((value) {
                                      setState(() {
                                        _viewModel.getAllVehicles();
                                      });
                                    });
                                  },
                                  icon: Icons.edit_note_sharp,
                                  backgroundColor: Colors.green,
                                  label: 'Update',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    deleteVehicle(idsList[index]);
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                ),
                              ]),
                          child: ListTile(
                              title: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: ClipOval(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.orange,
                                        radius: 80.0,
                                        child: vehicles[index]
                                                .vehicleImg!
                                                .isNotEmpty
                                            ? kIsWeb
                                                ? Image.network(
                                                    vehicles[index].vehicleImg!,
                                                    fit: BoxFit.fitHeight,
                                                    height: 200.0,
                                                    width: 200.0,
                                                  )
                                                : Image.file(
                                                    File(vehicles[index]
                                                        .vehicleImg!),
                                                    fit: BoxFit.fitWidth,
                                                    width: 200.0,
                                                  )
                                            : const Icon(
                                                Icons.garage_rounded,
                                                size: 50.0,
                                                color: Colors.black,
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        vehicles[index].buyedOn!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                vehicles[index].buyedOn!)),
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        vehicles[index].vehicleName!,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        vehicles[index].vehicleType!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      color: Colors.green,
                                      onPressed: () {
                                        context.router.push(MyAccessory(
                                            vehicleName:
                                                vehicles[index].vehicleName!));
                                      },
                                      child: const Text(
                                        'Your Accessories',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        );
                      },
                    );
                  }
                } else {
                  //Need to change
                  return Center(
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/empty_garage.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFffb700),
        onPressed: () {
          context.router.push(const AddVehicle()).then((value) {
            setState(() {
              _viewModel.getAllVehicles();
              _viewModel.getAllVehicleId();
            });
            getIds();
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  deleteVehicle(String id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do you want to remove this Vehicle from your Garage',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: 'Poppins',
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.green,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _viewModel.deleteVehicle(id);
                      setState(() {
                        _viewModel.getAllVehicles();
                      });
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
