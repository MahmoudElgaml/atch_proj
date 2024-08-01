import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        hintStyle: AppStyle.style13(context).copyWith(
          fontSize: 15,color: Colors.white.withOpacity(.3)
        ),
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: Colors.white,
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
