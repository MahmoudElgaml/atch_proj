import 'package:atch_proj/core/utils/app_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropMenu extends StatefulWidget {
  CustomDropMenu(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.isAuth,
      required this.setValue,
       this.isLang});

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
  String? selectedValue;
  final Map<String, String> items;

  final bool isAuth;
   bool? isLang=false;
  final void Function(String value) setValue;
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: widget.items.entries.map(
          (item) {
            return DropdownMenuItem<String>(
              value: item.value,
              child: FittedBox(
                  child: Text(
                item.key,
                style: AppStyle.style18(context),
              )),
            );
          },
        ).toList(),
        value: widget.selectedValue,
        onChanged: (String? value) {
          widget.setValue(value ?? "Factory");
          setState(() {
            widget.selectedValue = value ?? "Factory";
          });
          changeLangFunction(context);

        },
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: const Border(
                top: BorderSide(color: Color(0xffE4DFDF)),
                bottom: BorderSide(color: Color(0xffE4DFDF)),
                right: BorderSide(color: Color(0xffE4DFDF)),
                left: BorderSide(color: Color(0xffE4DFDF)),
              )),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: widget.isAuth ? 40 : null,
          width: widget.isAuth ? 140 : null,
        ),
        menuItemStyleData: const MenuItemStyleData(),
      ),
    );
  }

  void changeLangFunction(BuildContext context) {
    if (widget.isLang??false) {
      if (widget.selectedValue == "Arabic") {
        if (context.locale.toString() == "en") {
          context.setLocale(const Locale('ar'));
        }
      } else {
        if (context.locale.toString() == "ar") {
          context.setLocale(const Locale('en'));
        }
      }
    }
  }
}
