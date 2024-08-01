import 'package:flutter/material.dart';


class CostumeTextFiled extends StatefulWidget {
  const CostumeTextFiled({required this.title, super.key,required this.textEditingController});
  final TextEditingController? textEditingController;
  final String title;

  @override
  State<CostumeTextFiled> createState() => _CostumeTextFiledState();
}

class _CostumeTextFiledState extends State<CostumeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: const TextStyle(fontSize: 13),),
         TextField(
          controller: widget.textEditingController,
          decoration: const InputDecoration(),
        )
      ],
    );
  }
}
