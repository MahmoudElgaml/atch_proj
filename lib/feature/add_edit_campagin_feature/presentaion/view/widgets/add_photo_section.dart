import 'dart:typed_data';

import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../generated/assets.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({super.key, required this.isEdit});

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              context.tr("addPhoto"),
              style: AppStyle.style21Regular(context),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => AddImageCubit.get(context).addImage(isEdit),
              icon: SvgPicture.asset(
                Assets.imagesAddPhotoIcon,
                width: 15,
                height: 15,
                colorFilter: const ColorFilter.mode(
                  AppColor.PrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        const Gap(19),
        BlocBuilder<AddImageCubit, AddImageState>(
          builder: (context, state) {
            var images = AddImageCubit.get(context).images;
            return images.isEmpty
                ? const EmptyListPhoto()
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const Gap(15),
                      itemBuilder: (context, index) => ImageItem(
                        index: isEdit ? index : index + 1,
                        image: isEdit ? images[index] : images[index + 1],
                      ),
                      itemCount: isEdit ? images.length : images.length - 1,
                    ),
                  );
          },
        ),
      ],
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image, required this.index});

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

class EmptyListPhoto extends StatelessWidget {
  const EmptyListPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Gap(20),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.grayColor,
          ),
        ),
      ),
    );
  }
}
