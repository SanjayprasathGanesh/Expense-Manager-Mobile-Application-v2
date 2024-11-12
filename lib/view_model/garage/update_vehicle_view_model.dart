import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/model/mygarage/vehicle_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/drop_down.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../controller/image_controller.dart';
import '../../controller/local_storage_controller.dart';
import '../../database/database_connection.dart';

class UpdateVehicleViewModel extends GetxController {
  ImageController? imageController;

  DatabaseConnection databaseConnection = DatabaseConnection();
  RxBool isLoaded = false.obs;

  var vehicleImg = ''.obs;

  UpdateVehicleViewModel() {
    imageController = Get.find<ImageController>();
  }

  TextEditingController vehicleName = TextEditingController();
  Rx<TextEditingController> vehicleType = TextEditingController().obs;
  TextEditingController buyedOn = TextEditingController();
  TextEditingController price = TextEditingController();

  List<String> typeList = ['Bike', 'Scooter', 'Car', 'Bus', 'Truck', 'Cycle'];

  Widget buildForms(BuildContext context) {
    List<Widget> fields = [
      MyTextField(
        controller: vehicleName,
        title: 'Enter the Vehicle Name',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.text,
        readOnly: false,
        validator: ValidationBuilder().required('Empty Vehicle Name').build(),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          'Select the Transaction Type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      Obx(() => MyDropDown(
          list: typeList,
          onChanged: (String value) {
            vehicleType.value.text = value;
          },
          value: vehicleType.value.text)),
      MyDatePicker(
          title: 'Select the Date',
          firstDate: DateTime(DateTime.now().year - 5),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          validator: ValidationBuilder().required('Empty Date').build(),
          controller: buyedOn),
      MyTextField(
        controller: price,
        title: 'Enter the Price',
        showIcon: false,
        showPsw: false,
        textInputType: TextInputType.number,
        readOnly: false,
        validator: ValidationBuilder().required('Empty Price').build(),
      ),
    ];

    List<Widget> circularField = [
      const Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      )),
    ];

    return Obx(() => Column(
          children: isLoaded.isTrue ? fields : circularField,
        ));
  }

  setInitialValues(String id) async {
    DocumentSnapshot ds = await databaseConnection.getVehicleById(id);
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    Vehicle vehicle = Vehicle.fromJson(map);
    vehicleName.text = vehicle.vehicleName!;
    vehicleType.value.text = vehicle.vehicleType!;
    vehicleImg.value = vehicle.vehicleImg!;
    buyedOn.text = vehicle.buyedOn!;
    price.text = vehicle.price!.toString();
    isLoaded.value = true;
  }

  updateVehicle(String id) async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    Vehicle vehicle = Vehicle(
        uName: uName,
        vehicleName: vehicleName.text,
        vehicleType: vehicleType.value.text,
        vehicleImg: UpdateVehicleViewModel().imageController?.getImage()?.path,
        buyedOn: buyedOn.text,
        price: double.parse(price.text));

    await databaseConnection.updateVehicle(id, vehicle);
  }
}
