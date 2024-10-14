import 'package:atch_proj/core/services/validation_service.dart';
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

  validateOnLocationLink(
      {required String link,
      required bool isLocation1,
      String? location1,
      String? location2}) {
    final RegExp locationRegExp = RegExp(
      r'^(https?:\/\/)?(www\.)?(google\.com\/maps\/|goo\.gl\/maps\/|maps\.google\.com\/|maps\.app\.goo\.gl\/|maps\.apple\.com\/)',
      caseSensitive: false,
    );
    if (!locationRegExp.hasMatch(link)) {
      return "Must be Location link";
    } else {
      if (isLocation1) {
        return ValidationService.validateLocationLink(link, location1);
      } else {
        return ValidationService.validateLocationLink2(location2);
      }
    }

    // Regular expression to match Google Maps and Apple Maps URLs

    // Check if the input matches the location URL pattern
  }
}
