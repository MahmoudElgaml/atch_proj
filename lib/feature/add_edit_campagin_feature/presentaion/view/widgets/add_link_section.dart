import 'package:animations/animations.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

import '../../manager/link_feature_cubit.dart';

class AddLinkSection extends StatelessWidget {
  const AddLinkSection({super.key, required this.linkCubit});

  final LinkFeatureCubit linkCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              context.tr("addLink"),
              style: AppStyle.style24Regular(context),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showModal(
                  configuration: const FadeScaleTransitionConfiguration(
                    transitionDuration: Duration(milliseconds: 800),
                  ),
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          onSubmitted: (value) {
                            if (isURL(value)) {
                              linkCubit.addLink(value);
                            }
                            context.pop();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        BlocBuilder<LinkFeatureCubit, LinkFeatureState>(
          bloc: linkCubit,
          builder: (context, state) {
            return linkCubit.links.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                    child: ListView.builder(
                      itemBuilder: (context, index) => LinkItem(
                        linkCubit: linkCubit,
                        link: linkCubit.links[index],
                        index: index,
                      ),
                      itemCount: linkCubit.links.length,
                    ),
                  );
          },
        )
      ],
    );
  }
}

class LinkItem extends StatelessWidget {
  const LinkItem(
      {super.key,
      required this.link,
      required this.index,
      required this.linkCubit});

  final String link;
  final int index;
  final LinkFeatureCubit linkCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Linkify(
          onOpen: (link) async => await lunchUrl(link.url),
          text: link,
        ),
        const Spacer(),
        IconButton(
          onPressed: () => linkCubit.deleteLink(index),
          icon: const Icon(
            Icons.delete,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

Future<void> lunchUrl(String link) async {
  final Uri uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}
