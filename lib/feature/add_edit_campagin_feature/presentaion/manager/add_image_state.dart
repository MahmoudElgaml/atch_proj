part of 'add_image_cubit.dart';

@immutable
abstract class AddImageState {}

class AddImageInitial extends AddImageState {}
class AddImageSuccessState extends AddImageState {}
class AddImageDeletedState extends AddImageState {}

class AddImageCoverSuccessState extends AddImageState {}

class AddImageCoverDeletedState extends AddImageState {}
