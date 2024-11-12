import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/garage/update_accessories_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../../auto_route/app_routes.gr.dart';

@RoutePage()
class UpdateAccessories extends StatefulWidget {
  final String? id;
  final String? vehicleName;
  const UpdateAccessories({super.key, this.vehicleName, this.id});

  @override
  State<UpdateAccessories> createState() => _UpdateAccessoriesState();
}

class _UpdateAccessoriesState extends State<UpdateAccessories> {
  final _key = GlobalKey<FormState>();
  final UpdateAccessoriesViewModel _viewModel = UpdateAccessoriesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.setInitialValues(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: Text(
          'Update Accessories for ${widget.vehicleName!}',
          style: const TextStyle(
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
                          child: _viewModel.billImg.isNotEmpty
                              ? kIsWeb
                                  ? Image.network(
                                      _viewModel.billImg.value,
                                      fit: BoxFit.fitHeight,
                                      height: 200.0,
                                      width: 200.0,
                                    )
                                  : Image.file(
                                      File(_viewModel.billImg.value),
                                      fit: BoxFit.fitWidth,
                                      width: 200.0,
                                    )
                              : _viewModel.imageController!
                                      .getImage()!
                                      .path
                                      .isNotEmpty
                                  ? kIsWeb
                                      ? Image.file(
                                          File(_viewModel.billImg.value),
                                          fit: BoxFit.fitHeight,
                                          height: 200.0,
                                          width: 200.0,
                                        )
                                      : Image.file(
                                          File(_viewModel.imageController!
                                              .getImage()!
                                              .path),
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
                MaterialButton(
                  onPressed: () {
                    ToastContext().init(context);
                    if (_key.currentState!.validate()) {
                      _viewModel.updateAccessories(
                          widget.vehicleName!, widget.id!);
                      Toast.show('Accessory updated Successfully',
                          duration: 3,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ));
                      context.router.popAndPush(
                          MyAccessory(vehicleName: widget.vehicleName!));
                    } else {
                      Toast.show('Empty Fields',
                          duration: 3,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ));
                    }
                  },
                  color: Colors.green,
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
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
