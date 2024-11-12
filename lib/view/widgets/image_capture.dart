import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:expense_manager/view_model/garage/add_vehicle_view_model.dart';
import 'package:expense_manager/view_model/garage/update_vehicle_view_model.dart';
import 'package:expense_manager/view_model/users/setuser_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../auto_route/app_routes.gr.dart';

@RoutePage()
class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key});

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  late CameraController controller;
  late Future<void> initializeFutureController;

  final SetUserProfileViewModel _profileViewModel = SetUserProfileViewModel();
  final AddVehicleViewModel _addVehicleViewModel = AddVehicleViewModel();
  final UpdateVehicleViewModel _updateVehicleViewModel =
      UpdateVehicleViewModel();

  bool flipCam = false, flashOn = false;
  var img = '';

  initializeCamera() async {
    try {
      final camera = await availableCameras();
      final firstCam = camera.first;
      controller = CameraController(firstCam, ResolutionPreset.high);
      setState(() {
        initializeFutureController = controller.initialize();
      });
    } catch (e) {
      Logger().e('Error in Initializing Camera : $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeCamera();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      controller.resumePreview();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  Future<bool> getPermission() async {
    var status = await Permission.storage.status;
    print('Status: $status');
    if (status.isDenied || status.isProvisional) {
      var result = await Permission.storage.request();
      print('Result: $result');
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getCamPermission() async {
    var status = await Permission.camera.status;
    print('Status: $status');
    if (status.isDenied || status.isProvisional) {
      var result = await Permission.storage.request();
      print('Result: $result');
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  takePicture() async {
    try {
      bool isGranted = await getCamPermission();
      if (isGranted) {
        final image = await controller.takePicture();

        _profileViewModel.imageController!.saveImage(File(image.path));
        // _addVehicleViewModel.imageController!.saveImage(File(image.path));
        // _updateVehicleViewModel.imageController!.saveImage(File(image.path));

        if (image != null) {
          context.router.push(const SaveImage()).then((value) {
            if (value == true) {
              context.router.pop(true);
            }
          });
        }
      } else {
        Get.dialog(
          const AlertDialog(
            title: Text(
              'Permission Denied',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      Logger().e('Error in taking Picture: $e');
    }
  }

  pickImage() async {
    try {
      bool isGranted = await getPermission();
      if (isGranted) {
        ImagePicker imagePicker = ImagePicker();
        final pickedImg =
            await imagePicker.pickImage(source: ImageSource.gallery);
        if (pickedImg != null) {
          _profileViewModel.imageController?.saveImage(File(pickedImg.path));
          // _addVehicleViewModel.imageController!.saveImage(File(pickedImg.path));
          // _updateVehicleViewModel.imageController!.saveImage(File(pickedImg.path));

          context.router.push(const SaveImage()).then((value) {
            if (value == true) {
              context.router.pop(true);
            }
          });
        }
      } else {
        Get.dialog(
          const AlertDialog(
            title: Text(
              'Permission Denied',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      Logger().e('Error in Picking Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          'Take Image',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 16.0,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                height: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenHeight - 360
                    : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenHeight - 280
                        : ResponsiveBreakpoints.of(context).screenHeight - 200,
                width: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                    : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth * 1.5
                        : ResponsiveBreakpoints.of(context).screenWidth,
                child: FutureBuilder(
                    future: initializeFutureController,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return CameraPreview(controller);
                      }
                    }),
              ),
              Container(
                width: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.4
                    : ResponsiveBreakpoints.of(context).isTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth * 1.5
                        : ResponsiveBreakpoints.of(context).screenWidth,
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  layout: ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                        child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () async {
                          await pickImage();
                        },
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.photo_library_outlined,
                            color: Colors.black,
                            size: 25.0,
                          ),
                        ),
                      ),
                    )),
                    ResponsiveRowColumnItem(
                        child: GestureDetector(
                      onTap: () async {
                        await takePicture();
                      },
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                    )),
                    ResponsiveRowColumnItem(
                        child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            flipCam = !flipCam;
                          });
                          if (flipCam) {
                            final cam = await availableCameras();
                            setState(() {
                              controller = CameraController(
                                  cam[1], ResolutionPreset.high);
                              initializeFutureController =
                                  controller.initialize();
                            });
                          } else {
                            final cam = await availableCameras();
                            setState(() {
                              controller = CameraController(
                                  cam[0], ResolutionPreset.high);
                              initializeFutureController =
                                  controller.initialize();
                            });
                          }
                        },
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.purple,
                          child: Icon(
                            Icons.flip_camera_android,
                            color: Colors.black,
                            size: 25.0,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
