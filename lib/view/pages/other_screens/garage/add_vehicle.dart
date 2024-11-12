import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/garage/add_vehicle_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../auto_route/app_routes.gr.dart';

@RoutePage()
class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _key = GlobalKey<FormState>();
  final AddVehicleViewModel _viewModel = AddVehicleViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Add Vehicle',
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
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        width: ResponsiveBreakpoints.of(context).isDesktop
            ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
            : ResponsiveBreakpoints.of(context).isTablet
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
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
                Obx(() {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(const ImageCapture());
                      },
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 80.0,
                          child: _viewModel.imageController!
                                  .getImage()!
                                  .path
                                  .isNotEmpty
                              ? kIsWeb
                                  ? Image.network(
                                      _viewModel.imageController!
                                          .getImage()!
                                          .path,
                                      fit: BoxFit.fitHeight,
                                      height: 200.0,
                                      width: 200.0,
                                    )
                                  : Image.file(
                                      _viewModel.imageController!.getImage()!,
                                      fit: BoxFit.fitWidth,
                                      width: 200.0,
                                    )
                              : const Icon(
                                  Icons.person_add_alt,
                                  size: 50.0,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20.0,
                ),
                _viewModel.buildForms(),
                const SizedBox(
                  height: 5.0,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.green,
                  onPressed: () {
                    _viewModel.addVehicle();
                    context.router.popAndPush(const MyGarage());
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
