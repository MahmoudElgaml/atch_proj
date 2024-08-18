import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';

import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/unite_testing/manger/test_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/service_locator/config.dart';
import '../account_feature/user/data/model/EditUserData.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: Column(
        children: [
          const TestUploadImage(),
          ElevatedButton(
            onPressed: ()async {

              TestCubit.get(context).test();

            },
            child: const Text("test"),
          ),
        ],
      ),
    );
  }
}
