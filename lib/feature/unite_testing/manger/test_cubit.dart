
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/repo/advertise_account_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit(this.advertiseAccountRepo) : super(TestInitial());
  AdvertiseAccountRepo advertiseAccountRepo;
static TestCubit get(context)=>BlocProvider.of(context);
  test(EditAdvertiseData advertise ) async {
    emit(TestLoadingState());
    var result = await advertiseAccountRepo.editAdvertise(advertise);
    result.fold(
      (l) {

        emit(TestFailState());
      },
      (r) {

        emit(TestSuccessState());
      },
    );
  }
}
