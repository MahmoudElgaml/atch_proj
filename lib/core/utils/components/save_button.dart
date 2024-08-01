import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Icon(
          Icons.favorite_outlined,
          color: Color(0xffeb5757),
        ),
      ),
    );
  }
}
