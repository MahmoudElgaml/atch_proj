import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/feature/account_feature/data/model/EditUserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/unite_testing/manger/test_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/service_locator/config.dart';

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
              var id =await getIt<StorageToken>().getToken();
              EditUserData user=EditUserData(
                image: UploadImageService.imageFile,
                password: "123",
                email: "hoda@gmail.com",
                name: "hoda",
                 age: "30",
                userId: 6,
                 username: "mahmoud"
              );
              TestCubit.get(context).test(user);

            },
            child: const Text("test"),
          ),
        ],
      ),
    );
  }
}
