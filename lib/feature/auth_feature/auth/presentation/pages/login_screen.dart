import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';


import '../widgets/login_drawer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
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
      ),

          const LogInDrawer(),
        ],
      ),
    );
  }
}
