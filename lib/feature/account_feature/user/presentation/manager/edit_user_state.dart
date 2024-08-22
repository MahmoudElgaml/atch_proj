part of 'edit_user_cubit.dart';

@immutable
abstract class EditUserState {}

class EditUserInitial extends EditUserState {}
class EditUserLoadingState extends EditUserState {}
class EditUserFailState extends EditUserState {
  final String message;

  EditUserFailState(this.message);
}
class EditUserSuccessState extends EditUserState {}
