import 'package:atch_proj/feature/search_feature/presentation/view/widgets/filter_button.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_item.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SearchTextField()),
                Gap(10),
                FilterButton()
              ],
            ),
            Gap(20),
            SearchItem()
          ],
        ),
      ),
    );
  }
}
