import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';

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
          const TestUploadImage(isEdit: false),
          ElevatedButton(
            onPressed: () {
              EditAdvertiseData advertise = EditAdvertiseData(
                  password: "1235789",
                  advertiserName: "ana crazy",
                  advertiserId:12,
                  image: UploadImageService.imageFile,
                  about: "ss",
                  advertiserLocations: ["faisal"],
                  visa: "50165405463",
                  advertiserPhones: ["0123456789","01254"],
                  advertiserType: "Shop",
                  companyName: "Mesho",
                  contactEmail: "testttoo@gmail.com",

              );
              TestCubit.get(context).test(advertise);
            },
            child: const Text("test"),
          ),
        ],
      ),
    );
  }
}
