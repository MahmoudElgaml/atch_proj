import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

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
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.1,
          child: ListView.builder(
            itemBuilder: (context, index) => const LinkItem(link: "mahmoud"),

            itemCount: 10,
          ),
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
