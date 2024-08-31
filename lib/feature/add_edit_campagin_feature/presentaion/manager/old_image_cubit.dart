import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'old_image_state.dart';

@injectable
class OldImageCubit extends Cubit<OldImageState> {
  OldImageCubit() : super(OldImageInitial());
  List<String> myImages = [];

  static OldImageCubit get(context) => BlocProvider.of(context);

  setOldImage(List<String> oldImage) {
    myImages = oldImage;
  }

  deleteImage(int index) {
    myImages.removeAt(index);
    emit(OldImageDeleteSuccessState());
    emit(OldImageInitial());
  }
}
