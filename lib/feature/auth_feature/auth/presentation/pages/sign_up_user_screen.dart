import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/generated/assets.dart';

import 'package:flutter/material.dart';


import '../widgets/signup_user_drawer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top:44.0),
                  child: Row(
                    children: [
                      Expanded(child: Image.asset(Assets.imagesGLogo)),
                      const Expanded(child: TestUploadImage(isEdit: false,)),
                    ],
                  ),
                )
            ),

            const UserSignUpDrawer()
          ],
        ),
      ),
    );
  }
}
