import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/model/contact_us/contact_us_model.dart';
import 'package:expense_manager/view/widgets/date_picker.dart';
import 'package:expense_manager/view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../controller/local_storage_controller.dart';

class ContactUsViewModel extends GetxController {
  DatabaseConnection databaseConnection = DatabaseConnection();

  TextEditingController emailId = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController content = TextEditingController();

  Widget buildForms() {
    List<Widget> fields = [
      MyDatePicker(
        title: 'Select the Date',
        firstDate: DateTime(DateTime.now().year - 10),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        validator:
            ValidationBuilder(requiredMessage: 'Empty Date Field').build(),
        controller: date,
      ),
      MyTextField(
          controller: emailId,
          title: 'Enter Your Email-Id',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator: ValidationBuilder(requiredMessage: 'Empty Email Id Field')
              .build()),
      MyTextField(
          controller: subject,
          title: 'Enter the Subject',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator: ValidationBuilder(requiredMessage: 'Empty Subject Field')
              .build()),
      MyTextField(
          controller: content,
          title: 'Enter Your Feedback',
          showIcon: false,
          showPsw: false,
          textInputType: TextInputType.text,
          readOnly: false,
          validator:
              ValidationBuilder(requiredMessage: 'Empty Feedback content Field')
                  .build()),
    ];

    return Column(
      children: fields,
    );
  }

  sendFeedback() async {
    LocalLoginStorageController localStorageController = LocalLoginStorageController();
    String uName = await localStorageController.getUserName();

    ContactUs contactUs = ContactUs(
      uName: uName,
      date: date.text,
      emailId: emailId.text,
      subject: subject.text,
      content: content.text,
    );

    await databaseConnection.sendFeedback(contactUs);
  }
}
