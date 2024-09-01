import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/account_feature/user/data/model/EditUserData.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/edit_user_cubit.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/service_locator/config.dart';
import '../../../../auth_feature/auth/presentation/pages/test_upload_image.dart';
import '../../../../auth_feature/auth/presentation/widgets/costume_text_filed.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({super.key});

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController age = TextEditingController();
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      setData();
      isFirst = false;
    }
    return BlocConsumer<EditUserCubit, EditUserState>(
      listener: (context, state) async {
        if (state is EditUserLoadingState) {
          EasyLoading.show();
        } else if (state is EditUserFailState) {
          EasyLoading.dismiss();
          EasyLoading.showError("");
        } else if (state is EditUserSuccessState) {
         await Helper.retrievePerson().delete();
          await EasyLoading.showSuccess("");
          if(context.mounted){
            context.go(AppRoute.logInKey);
          }

        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const Gap(10),
            const TestUploadImage(
              isEdit: true,
            ),
            CostumeTextFiled(
              title: "Name",
              textEditingController: name,
            ),
            const Gap(25),
            CostumeTextFiled(
              title: "UserName",
              textEditingController: username,
            ),
            const Gap(25),
            CostumeTextFiled(
              title: "Email",
              textEditingController: email,
            ),
            const Gap(25),
            CostumeTextFiled(
              isPassword: true,
              title: "New password",
              textEditingController: password,
            ),
            const Gap(25),
            CostumeTextFiled(
              title: "age",
              textEditingController: age,
            ),
            const Gap(25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                ),
                onPressed: () {
                  var userId = getIt<HiveManager>()
                      .retrieveSingleData<Person>(HiveKeys.userBox)
                      .id;
                  EditUserData editUser = EditUserData(
                    image: UploadImageService.imageFile,
                    password: password.text,
                    username: username.text,
                    age: age.text,
                    name: name.text,
                    email: email.text,
                    userId: userId,
                  );

                  EditUserCubit.get(context).editUser(editUser);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Update",
                    style: AppStyle.style24Regular(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  setData() {
    var person = getIt<HiveManager>().retrieveSingleData<Person>(HiveKeys.userBox);
    username.text = person.name ?? "";
    email.text = person.email ?? "";
    name.text = person.name ?? "";
    age.text = person.age.toString();
  }
}
