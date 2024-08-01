part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccessState extends AuthState {}
class AuthFailState extends AuthState {
 final  String message;

  AuthFailState(this.message);
}
class AuthLoadingState extends AuthState {}

