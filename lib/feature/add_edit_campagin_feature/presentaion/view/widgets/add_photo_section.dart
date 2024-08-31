import 'dart:typed_data';

import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Add Photo",
              style: AppStyle.style24Regular(context),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => AddImageCubit.get(context).addImage(),
              icon: const Icon(Icons.add),
              color: Colors.black,
            ),
          ],
        ),
        const Gap(19),
        BlocBuilder<AddImageCubit, AddImageState>(
          builder: (context, state) {
            var images = AddImageCubit.get(context).images;
            return
            images.isEmpty?const SizedBox():
              SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const Gap(15),
                itemBuilder: (context, index) => ImageItem(
                  index: index,
                  image: images[index],
                ),
                itemCount: images.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image,required this.index});

  final Uint8List image;
 final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SizedBox(width: 200, height: 200, child: Image.memory(image)),
        ),
        IconButton(
          onPressed: () => AddImageCubit.get(context).delete(index),
          icon: const Icon(Icons.highlight_remove),
          color: Colors.grey,
        )
      ],
    );
  }
}
