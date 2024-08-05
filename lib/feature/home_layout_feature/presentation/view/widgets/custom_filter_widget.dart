import 'package:flutter/material.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
