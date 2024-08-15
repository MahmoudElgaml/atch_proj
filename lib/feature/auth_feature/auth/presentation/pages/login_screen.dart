import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/logo_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';

import '../widgets/login_drawer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          LogoWidget(),
          LogInDrawer(),
        ],
      ),
    );
  }
}
