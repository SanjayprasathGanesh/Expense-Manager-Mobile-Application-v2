import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  final List<String> list;
  final void Function(String) onChanged;
  final String value;
  const MyDropDown(
      {super.key,
      required this.list,
      required this.onChanged,
      required this.value});

  @override
  State<MyDropDown> createState() => _MyDropDownState();

  String getSelectedValue() {
    return _MyDropDownState.selected;
  }
}

class _MyDropDownState extends State<MyDropDown> {
  static String selected = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.value;
    print("Selected : ${selected}");
  }

  @override
  Widget build(BuildContext context) {
    List<String> uniqueList = widget.list.toSet().toList();

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
          value: selected,
          onChanged: (String? value) {
            setState(() {
              selected = value!;
              // widget.onChanged(selected);
            });
            widget.onChanged.call(selected);
          },
          items: uniqueList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
