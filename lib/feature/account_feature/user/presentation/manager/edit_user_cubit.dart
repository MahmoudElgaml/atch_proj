import 'package:atch_proj/feature/account_feature/user/data/model/EditUserData.dart';
import 'package:atch_proj/feature/account_feature/user/data/repo/user_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'edit_user_state.dart';

@injectable
class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit(this.userAccountRepo) : super(EditUserInitial());

  UserAccountRepo userAccountRepo;
  static  EditUserCubit get(context)=>BlocProvider.of(context);
  editUser(EditUserData editUser) async {
    emit(EditUserLoadingState());
    var result = await userAccountRepo.editProfileUSer(editUser);
    result.fold(
      (l) {
        emit(EditUserFailState(l.message));
      },
      (r) {
        emit(EditUserSuccessState());
      },
    );
  }
}
