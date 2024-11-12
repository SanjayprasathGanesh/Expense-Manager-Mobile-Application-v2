import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:expense_manager/view_model/users/setuser_profile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toast/toast.dart';

@RoutePage()
class SetUserProfile extends StatefulWidget {
  const SetUserProfile({super.key});

  @override
  State<SetUserProfile> createState() => _SetUserProfileState();
}

class _SetUserProfileState extends State<SetUserProfile> {
  final SetUserProfileViewModel _profileViewModel = SetUserProfileViewModel();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileViewModel.setUName();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(SetUserProfileViewModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffb700),
        title: const Text(
          "Set User Profile",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
        leading: null,
      ),
      backgroundColor: const Color(0xFFffe5ec),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.all(10.0),
            width: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.45
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.35
                    : ResponsiveBreakpoints.of(context).screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
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
                          child: _profileViewModel.imageController!
                                  .getImage()!
                                  .path
                                  .isNotEmpty
                              ? kIsWeb
                                  ? Image.network(
                                      _profileViewModel.imageController!
                                          .getImage()!
                                          .path,
                                      fit: BoxFit.fitHeight,
                                      height: 200.0,
                                      width: 200.0,
                                    )
                                  : Image.file(
                                      _profileViewModel.imageController!
                                          .getImage()!,
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
                ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              _profileViewModel.buildForms(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          _profileViewModel.clearForm();
                                        });
                                      },
                                      child: const Text(
                                        "Clear",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                        ),
                                      )),
                                  MaterialButton(
                                      color: Colors.green,
                                      onPressed: () async {
                                        ToastContext().init(context);

                                        if (_key.currentState!.validate()) {
                                          _profileViewModel.addUser();
                                          context.router
                                              .push(const MainRoute());
                                          Toast.show(
                                            'User Profile Created Successfully',
                                            backgroundColor: Colors.green,
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0),
                                            duration: 3,
                                          );
                                        } else {
                                          Toast.show(
                                            'Empty Fields',
                                            backgroundColor: Colors.red,
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0),
                                            duration: 3,
                                          );
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Set Profile",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          )),
                    ),
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
