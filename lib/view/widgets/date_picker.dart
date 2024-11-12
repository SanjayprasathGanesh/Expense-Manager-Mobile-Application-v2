import 'package:flutter/material.dart';

import '../../view_model/users/setuser_profile_view_model.dart';

class MyDatePicker extends StatefulWidget {
  final String title;
  final DateTime firstDate;
  final DateTime initialDate;
  final DateTime lastDate;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const MyDatePicker(
      {super.key,
      required this.title,
      required this.firstDate,
      required this.initialDate,
      required this.lastDate,
      required this.validator,
      required this.controller});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  selectDate() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: widget.initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFffb700),
              onPrimary: Colors.white,
              surface: Colors.teal,
              onSurface: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null) {
      setState(() {
        widget.controller.text = selected.toString().split(" ")[0];
        // SetUserProfileViewModel().calculateAge(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: TextInputType.datetime,
          cursorColor: Colors.black,
          readOnly: true,
          onTap: () async {
            await selectDate();
          },
          // onChanged: (value){
          //   if(value.isNotEmpty) {
          //     SetUserProfileViewModel().setAge();
          //   }
          // },
          decoration: InputDecoration(
            label: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          )),
    );
  }
}
