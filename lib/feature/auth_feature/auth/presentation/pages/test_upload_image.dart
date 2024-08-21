import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/service_locator/config.dart';

class TestUploadImage extends StatefulWidget {
  const TestUploadImage({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<TestUploadImage> createState() => _TestUploadImageState();
}

var profilepic =
    getIt<HiveManager>().retrieveData<Person>(HiveKeys.userBox)[0].profilePic;

class _TestUploadImageState extends State<TestUploadImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: UploadImageService.selectedImage == null
                      ? widget.isEdit
                          ? NetworkImage(profilepic ?? ConstValue.emptyImage)
                          : const AssetImage(Assets.assetsImagesEmptyImage)
                      : MemoryImage(UploadImageService.selectedImage!),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () async {
                      await UploadImageService.selectImage(ImageSource.gallery);
                      setState(() {});
                    },
                    icon: const Icon(Icons.add_a_photo_outlined),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
