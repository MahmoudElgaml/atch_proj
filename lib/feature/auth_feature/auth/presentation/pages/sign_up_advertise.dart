import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/advertise_sign_drawer.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';


class SignUpAdvertise extends StatefulWidget {
  const SignUpAdvertise({super.key});

  @override
  State<SignUpAdvertise> createState() => _SignUpAdvertiseState();
}

class _SignUpAdvertiseState extends State<SignUpAdvertise> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 36, right: 36),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: LogoWidget()),
                  Expanded(child: TestUploadImage(isEdit: false)),
                ],
              ),
              AdvertiseSignDrawer()
            ],
          ),
        ),
      ),
    );
  }
}
