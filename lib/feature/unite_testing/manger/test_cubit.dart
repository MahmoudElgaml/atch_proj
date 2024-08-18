import 'package:atch_proj/feature/account_feature/data/repo/account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit(this.accountRepo) : super(TestInitial());
  AccountRepo accountRepo;
static TestCubit get(context)=>BlocProvider.of(context);
  test() async {
    emit(TestLoadingState());
    var result = await accountRepo.getRecentlyView();
    result.fold(
      (l) {
        emit(TestFailState());
      },
      (r) {
        print(r.campaigns?.length);
        emit(TestSuccessState());
      },
    );
  }
}
