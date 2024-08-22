import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/old_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';

class OldImageSection extends StatelessWidget {
  const OldImageSection({super.key, required this.oldImages});

  final List<String> oldImages;

  @override
  Widget build(BuildContext context) {

    OldImageCubit.get(context).setOldImage(oldImages);

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Old Photo",
              style: AppStyle.style24Regular(context),
            ),
          ],
        ),
        BlocBuilder<OldImageCubit, OldImageState>(
          builder: (context, state) {
            var images = OldImageCubit.get(context).myImages;
            return OldImageList(
              oldImage: images,
            );
          },
        ),
      ],
    );
  }
}

class OldImageList extends StatelessWidget {
  const OldImageList({super.key, required this.oldImage});

  final List<String> oldImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(15),
        itemBuilder: (context, index) => ImageItem(
          index: index,
          image: oldImage[index],
        ),
        itemCount: oldImage.length,
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image, required this.index});

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.network(image),
          ),
        ),
        IconButton(
          onPressed: () => OldImageCubit.get(context).deleteImage(index),
          icon: const Icon(Icons.highlight_remove),
          color: Colors.grey,
        )
      ],
    );
  }
}
