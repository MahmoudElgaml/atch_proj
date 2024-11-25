import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:flutter/material.dart';

class SelectRoleSection extends StatefulWidget {
  const SelectRoleSection({super.key});

  @override
  State<SelectRoleSection> createState() => _SelectRoleSectionState();
}

class _SelectRoleSectionState extends State<SelectRoleSection> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              AuthCubit.get(context).isAdvertiser = true;
              setState(() {});
            },
            child: selectRoleContainer(context, "Advertiser", true),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              AuthCubit.get(context).isAdvertiser = false;
              setState(() {});
            },
            child: selectRoleContainer(context, "Purchaser", false),
          ),
        ],
      ),
    );
  }

  AnimatedContainer selectRoleContainer(
      BuildContext context, String title, bool isAdvertiser) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: ShapeDecoration(
        color: isAdvertiser ? advertiserCheck(context) : userCheck(context),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 4, color: AppColor.yellowColor),
          borderRadius: BorderRadius.only(
              topLeft: isAdvertiser
                  ? const Radius.circular(1000)
                  : const Radius.circular(0),
              bottomLeft: isAdvertiser
                  ? const Radius.circular(1000)
                  : const Radius.circular(0),
              topRight: !isAdvertiser
                  ? const Radius.circular(1000)
                  : const Radius.circular(0),
              bottomRight: !isAdvertiser
                  ? const Radius.circular(1000)
                  : const Radius.circular(0)),
        ),
      ),
      child: Text(
        title,
        style: AppStyle.style21Medium(context).copyWith(
          color: isAdvertiser ? userCheck(context) : advertiserCheck(context),
        ),
      ),
    );
  }

  Color advertiserCheck(BuildContext context) {
    return AuthCubit.get(context).isAdvertiser
        ? AppColor.yellowColor
        : Colors.white;
  }

  Color userCheck(BuildContext context) {
    return AuthCubit.get(context).isAdvertiser
        ? Colors.white
        : AppColor.yellowColor;
  }
}
