import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Column(
        children: [
          SearchTextField()
        ],
      ),
    );
  }
}
