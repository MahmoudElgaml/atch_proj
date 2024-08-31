import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/search_feature/presentation/manger/search_cubit.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/filter_button.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    textEditingController: search,
                  ),
                ),
                const Gap(10),
                const FilterButton()
              ],
            ),
            const Gap(20),
            const SearchList(),
          ],
        ),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchFailState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is SearchSuccessState) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) => CampaignItem(
                campaigns: state.searchItemModel.campaigns![index],
              ),
              itemCount: state.searchItemModel.campaigns?.length ?? 0,
            ),
          );
        } else if (state is SearchLoadingState) {
          return const Expanded(
            child: LoadingRectangleComponent(),
          );
        }
        return Expanded(
          child: Center(
            child: Text(
              context.tr("typeSearch"),
              style: AppStyle.style34(context),
            ),
          ),
        );
      },
    );
  }
}
