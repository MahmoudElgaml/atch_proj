import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/search_feature/presentation/manger/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        SearchCubit.get(context).search(value);
      },
      controller: textEditingController,
      decoration: InputDecoration(
        disabledBorder: Helper.buildOutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: Helper.buildOutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: Helper.buildOutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: 'what do you have in mind?',
        hintStyle: AppStyle.style20Regular(context).copyWith(
          color: AppColor.PrimaryColor,
        ),
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: AppColor.PrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
