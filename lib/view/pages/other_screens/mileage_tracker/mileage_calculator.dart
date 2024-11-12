import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/mileage_tracker/mileage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl.dart';

import '../../../../view_model/mileage_tracker/add_mileage_view_model.dart';

@RoutePage()
class MileageTracker extends StatefulWidget {
  const MileageTracker({super.key});

  @override
  State<MileageTracker> createState() => _MileageTrackerState();
}

class _MileageTrackerState extends State<MileageTracker> {
  final MileageViewModel _viewModel = MileageViewModel();

  List<String> idsList = [];

  getIds() async {
    idsList = await _viewModel.getAllMileageId();
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
          'Mileage Tracker',
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
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: FutureBuilder(
            future: _viewModel.getAllMileage(),
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
                  final mileage = snapshot.data;
                  if (mileage!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 270,
                                child: Image.asset(
                                  'images/emptyPetrol.jpg',
                                  fit: BoxFit.fitHeight,
                                )),
                            const Text(
                              'No Fuelling has been recorded',
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
                      itemCount: mileage.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.router
                                        .push(UpdateMileage(id: idsList[index]))
                                        .then((value) {
                                      setState(() {
                                        _viewModel.getAllMileage();
                                      });
                                    });
                                  },
                                  icon: Icons.edit_note_sharp,
                                  backgroundColor: Colors.green,
                                  label: 'Update',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    deleteMileage(idsList[index]);
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Start Km:${mileage[index].startKm!}',
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
                                        'End Km:${mileage[index].endKm!}',
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Litres : ${mileage[index].ttlLitres!.toString()}',
                                        textAlign: TextAlign.justify,
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
                                        '₹ ${mileage[index].price.toString()}',
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          color: Colors.green,
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
                                        mileage[index].date!,
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                mileage[index].date!)),
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Total Distance : ${mileage[index].ttlDistance}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Mileage : ${mileage[index].mileage}',
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
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
                  return Center(
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/emptyPetrol.jpg'),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          context.router.push(const AddMileage()).then((value) {
            setState(() {
              _viewModel.getAllMileage();
              _viewModel.getAllMileageId();
            });
            getIds();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  deleteMileage(String id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Do you want to delete this Fuel Record',
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
                      _viewModel.deleteMileage(id);
                      setState(() {
                        _viewModel.getAllMileage();
                      });
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    child: const Text(
                      'Delete',
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
