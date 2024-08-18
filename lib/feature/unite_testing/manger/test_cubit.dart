
import 'package:atch_proj/feature/account_feature/advertise/data/repo/advertise_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../account_feature/user/data/model/EditUserData.dart';
import '../../account_feature/user/data/repo/user_account_repo.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit(this.advertiseAccountRepo) : super(TestInitial());
  AdvertiseAccountRepo advertiseAccountRepo;
static TestCubit get(context)=>BlocProvider.of(context);
  test( ) async {
    emit(TestLoadingState());
    var result = await advertiseAccountRepo.getAdvertiseInfo();
    result.fold(
      (l) {
        emit(TestFailState());
      },
      (r) {
       print(r.advertiser!.advertiserName);
        emit(TestSuccessState());
      },
    );
  }
}
