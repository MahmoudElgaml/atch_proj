import 'package:flutter/material.dart';


class CostumeAvatar extends StatelessWidget {
  const CostumeAvatar(this.image, {super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23,vertical: 23),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.shade300
          ),
          shape: BoxShape.circle
      ),
      child: Image.asset(image),
    );
  }


}