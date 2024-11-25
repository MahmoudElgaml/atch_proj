import 'package:atch_proj/feature/account_feature/advertise/data/repo/advertise_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

@injectable
class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this.advertiseAccountRepo) : super(DeleteAccountInitial());
  AdvertiseAccountRepo advertiseAccountRepo;

  static DeleteAccountCubit get(context) => BlocProvider.of(context);

  deleteAccountForBoth(num? id, String? role) async {
    emit(DeleteAccountLoadingState());
    var result = await advertiseAccountRepo.deleteAccount(id, role);
    result.fold(
      (l) {
        emit(DeleteAccountFailState(l.message));
      },
      (r) {
        emit(DeleteAccountSuccessState());
      },
    );
  }
}
