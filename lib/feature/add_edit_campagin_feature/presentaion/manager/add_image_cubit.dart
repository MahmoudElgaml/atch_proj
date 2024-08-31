import 'dart:typed_data';

import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_image_state.dart';

@injectable
class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit() : super(AddImageInitial());
  List<Uint8List> images = [];
  List<XFile> backendImages = [];

  static AddImageCubit get(context) => BlocProvider.of(context);

  addImage() async {
    await UploadImageService.selectImage(ImageSource.gallery);
    UploadImageService.selectedImage != null
        ? images.add(UploadImageService.selectedImage!)
        : null;
    UploadImageService.imageFile != null
        ? backendImages.add(UploadImageService.imageFile!)
        : null;
    UploadImageService.selectedImage = null;
    emit(AddImageSuccessState());
  }

  delete(int index) {
    images.removeAt(index);
    backendImages.removeAt(index);
    emit(AddImageDeletedState());
  }
}
