import 'package:flutter/material.dart';

class CostumeTextFiled extends StatelessWidget {
  const CostumeTextFiled(
      {required this.title, super.key, required this.textEditingController,this.validator,this.keyboardType});

  final TextEditingController? textEditingController;
  final String title;
 final String? Function(String?value)? validator;
 final  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13),
        ),
        TextFormField(
          keyboardType:keyboardType ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: textEditingController,
          decoration: const InputDecoration(),
        )
      ],
    );
  }
}
