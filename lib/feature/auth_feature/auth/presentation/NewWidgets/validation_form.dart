import 'package:flutter/material.dart';

import '../../../../../core/services/validation_service.dart';
import '../../../../../core/utils/app_style.dart';

class ValidationForm extends StatefulWidget {
  const ValidationForm({super.key, required this.password});

  final TextEditingController password;

  @override
  State<ValidationForm> createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  bool is8Char = false;
  bool isSpecialChar = false;

  @override
  void dispose() {
    super.dispose();
    widget.password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.password.addListener(
      () {
        is8Char = ValidationService.regex8Char.hasMatch(widget.password.text);
        isSpecialChar =
            ValidationService.regexSpecialChar.hasMatch(widget.password.text);
        setState(() {});
      },
    );
    return Column(
      children: [
        buildValListTile(
          context,
          title: "more than 8 characters",
          isValidate: is8Char,
        ),
        buildValListTile(
          context,
          title: "special characters",
          isValidate: isSpecialChar,
        ),
      ],
    );
  }

  Widget buildValListTile(
    BuildContext context, {
    required String title,
    required bool isValidate,
  }) {
    return ListTile(
      leading: Container(
        width: 5,
        height: 5,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
      visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
      title: Text(
        textAlign: TextAlign.start,
        title,
        style: AppStyle.style14Regular(context).copyWith(
          decorationColor: Colors.green,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 2,
          decoration: isValidate ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
