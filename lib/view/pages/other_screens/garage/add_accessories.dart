import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/view_model/garage/add_accessories_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

import '../../../../auto_route/app_routes.gr.dart';

@RoutePage()
class AddAccessories extends StatefulWidget {
  final String? vehicleName;
  const AddAccessories({super.key, this.vehicleName});

  @override
  State<AddAccessories> createState() => _AddAccessoriesState();
}

class _AddAccessoriesState extends State<AddAccessories> {
  final _key = GlobalKey<FormState>();
  final AddAccessoriesViewModel _viewModel = AddAccessoriesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: Text(
          'Add Accessories for ${widget.vehicleName!}',
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
                MaterialButton(
                  onPressed: () {
                    ToastContext().init(context);
                    if (_key.currentState!.validate()) {
                      _viewModel.addAccessories(widget.vehicleName!);
                      Toast.show('Accessory Added Successfully',
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
                    'Save',
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
