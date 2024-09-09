import 'package:atch_proj/feature/auth_feature/auth/data/model/SignDataTest.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';


@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  UserData userData = UserData();
  AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of(context);

  signIn(SignDataTest signData) async {
    emit(AuthLoadingState());
    var result = await authRepo.sign(signData);
    result.fold(
      (l) {
        emit(AuthFailState(l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  logIn(String email, String password, String role) async {
    emit(AuthLoadingState());
    var result =
        await authRepo.logIn(email: email, password: password, role: role);
    result.fold(
      (l) {
        emit(AuthFailState(l.message));
      },
      (r) {
        userData = r;
        emit(AuthSuccessState());
      },
    );
  }
}
