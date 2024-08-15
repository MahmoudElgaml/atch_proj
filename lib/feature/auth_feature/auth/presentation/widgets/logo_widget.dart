import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top:44.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 212,
                  height: 197,
                  child: Image.asset(Assets.imagesGLogo)),
            ],
          ),
        )
    );
  }
}
