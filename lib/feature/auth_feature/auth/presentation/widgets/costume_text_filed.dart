import 'package:flutter/material.dart';


class CostumeTextFiled extends StatelessWidget {
  const CostumeTextFiled({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(fontSize: 13),),
        const TextField(
          decoration: InputDecoration(),
        )
      ],
    );
  }
}
