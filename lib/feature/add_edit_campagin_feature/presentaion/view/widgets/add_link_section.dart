import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../manager/link_feature_cubit.dart';

class AddLinkSection extends StatelessWidget {
  const AddLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Add Link",
              style: AppStyle.style24Regular(context),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onSubmitted: (value) {
                          getIt<LinkFeatureCubit>().addLink(value);
                          context.pop();
                        },
                      ),
                    ),);
                  },
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        BlocBuilder<LinkFeatureCubit, LinkFeatureState>(
          builder: (context, state) {
            var links=LinkFeatureCubit.get(context).links;
            return SizedBox(
              height: MediaQuery
                  .sizeOf(context)
                  .height * .1,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                 LinkItem(link: links[index]),
                itemCount: links.length,
              ),
            );
          },
        )
      ],
    );
  }
}

class LinkItem extends StatelessWidget {
  const LinkItem({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    return Linkify(
      onOpen: (link) async => await lunchUrl(link.url),
      text: link,
    );
  }
}

Future<void> lunchUrl(String link) async {
  final Uri uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}
