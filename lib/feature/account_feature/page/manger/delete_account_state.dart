part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState {}

class DeleteAccountFailState extends DeleteAccountState {
  final String message;

  DeleteAccountFailState(this.message);
}

class DeleteAccountSuccessState extends DeleteAccountState {}
