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
          const TestUploadImage(),
          ElevatedButton(
            onPressed: () {
              EditAdvertiseData advertise = EditAdvertiseData(
                  password: "1235789",
                  advertiserName: "fathy",
                  advertiserId: 12,
                  image: UploadImageService.imageFile,
                  about: "ss",
                  advertiserLocations: ["cairo"],
                  advertiserPhones: ["010098999898"],
                  advertiserType: "Shop",
                  companyName: "hodalolololo",
                  contactEmail: "lolplplplpo@gmail.com",
                  visa: "333",
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
