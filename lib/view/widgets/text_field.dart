import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool showIcon;
  final bool showPsw;
  final TextInputType textInputType;
  final bool readOnly;
  final String? Function(String?)? validator;
  final int? maxLines;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.showIcon,
      required this.showPsw,
      required this.textInputType,
      required this.readOnly,
      required this.validator,
      this.maxLines});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showPassword = widget.showPsw;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: showPassword,
        readOnly: widget.readOnly,
        validator: widget.validator,
        cursorColor: Colors.black,
        maxLines: widget.maxLines,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
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
          suffix: widget.showIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: !showPassword
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                        ))
              : null,
        ),
      ),
    );
  }
}
