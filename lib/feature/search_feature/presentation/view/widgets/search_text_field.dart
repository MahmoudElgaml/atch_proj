import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/search_feature/presentation/manger/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key,required this.textEditingController});
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: (value) {
        SearchCubit.get(context).search(value);
      },
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        hintStyle: AppStyle.style13(context).copyWith(
          fontSize: 15,color: Colors.grey.withOpacity(.3)
        ),
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.transparent,
      ),
    );
  }

}
