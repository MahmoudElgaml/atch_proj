import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  const CustomTap({super.key, required this.categories});

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(21),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Center(
        child: Text(categories.title),
      ),
    );
  }
}
