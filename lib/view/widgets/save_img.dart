import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/garage/update_vehicle_view_model.dart';
import 'package:expense_manager/view_model/users/setuser_profile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../view_model/garage/add_vehicle_view_model.dart';

@RoutePage()
class SaveImage extends StatefulWidget {
  const SaveImage({super.key});

  @override
  State<SaveImage> createState() => _SaveImageState();
}

class _SaveImageState extends State<SaveImage> {
  final SetUserProfileViewModel _profileViewModel = SetUserProfileViewModel();
  final AddVehicleViewModel _addVehicleViewModel = AddVehicleViewModel();
  final UpdateVehicleViewModel _updateVehicleViewModel =
      UpdateVehicleViewModel();

  File? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = _profileViewModel.imageController!.getImage();
    image = _addVehicleViewModel.imageController!.getImage();
    image = _updateVehicleViewModel.imageController!.getImage();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const Scaffold(
        body: Center(
          child: Text('No image available'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Save Image',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 16.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          height: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenHeight
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenHeight
                  : ResponsiveBreakpoints.of(context).screenHeight,
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 1.5
                  : ResponsiveBreakpoints.of(context).screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                kIsWeb
                    ? Container(
                        height: ResponsiveBreakpoints.of(context).isDesktop
                            ? ResponsiveBreakpoints.of(context).screenHeight -
                                200
                            : ResponsiveBreakpoints.of(context).isTablet
                                ? ResponsiveBreakpoints.of(context)
                                        .screenHeight -
                                    250
                                : ResponsiveBreakpoints.of(context)
                                        .screenHeight -
                                    200,
                        child: Image.network(
                          image!.path,
                          fit: BoxFit.fill,
                        ))
                    : Container(
                        height: ResponsiveBreakpoints.of(context).isDesktop
                            ? ResponsiveBreakpoints.of(context).screenHeight -
                                200
                            : ResponsiveBreakpoints.of(context).isTablet
                                ? ResponsiveBreakpoints.of(context)
                                        .screenHeight -
                                    280
                                : ResponsiveBreakpoints.of(context)
                                        .screenHeight -
                                    200,
                        child: Image.file(
                          image!,
                          fit: BoxFit.fill,
                        )),
                const SizedBox(
                  height: 10.0,
                ),
                ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResponsiveRowColumnItem(
                        child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        context.router.pop(false);
                      },
                      child: const Text(
                        'Re Take',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    ResponsiveRowColumnItem(
                        child: MaterialButton(
                      color: Colors.green,
                      onPressed: () {
                        context.router.pop(true);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
