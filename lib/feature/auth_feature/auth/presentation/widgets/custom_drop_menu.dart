import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropMenu extends StatefulWidget {
  CustomDropMenu({super.key,required this.selectedValue});

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
  String selectedValue;
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  final List<String> items = [
    'user',
    'advertiser',
  ];



  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          widget.selectedValue,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ))
            .toList(),
        value: widget.selectedValue,
        onChanged: (String? value) {
          setState(() {
            widget.selectedValue = value ?? "user";
          });
        },
        buttonStyleData:  ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
              border: const Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
          )),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
