import 'package:flutter/material.dart';


import '../../../../../core/utils/app_style.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton({required this.title, super.key,required this.onPressed});

  final String title;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
        gradient: LinearGradient(
          colors: [Color(0xff8658E8), Color(0xff4718AD)],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          title,
          style: AppStyle.styleWhite,
        ),
      ),
    );
  }
}
