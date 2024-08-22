import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/repo/advertise_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'advertise_info_state.dart';

@injectable
class AdvertiseInfoCubit extends Cubit<AdvertiseInfoState> {
  AdvertiseInfoCubit(this.advertiseAccountRepo) : super(AdvertiseInfoInitial());
  AdvertiseAccountRepo advertiseAccountRepo;
  AdvertiseInfoModel? advertiseInfoModel;
  static AdvertiseInfoCubit get(context)=>BlocProvider.of(context);
  @override
  void emit(AdvertiseInfoState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
  getAdvertiseInfo() async {
    emit(AdvertiseAccountLoadingState());
    var result = await advertiseAccountRepo.getAdvertiseInfo();
    result.fold(
      (l) {
        emit(AdvertiseAccountFailState(l.message));

      },
      (advertise) {
        advertiseInfoModel=advertise;
        emit(AdvertiseAccountSuccessState());

      },
    );
  }
}
