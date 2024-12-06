import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/repo/advertise_account_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

import '../../../../home_feature/data/model/CampaignModel.dart';

part 'advertise_info_state.dart';

@injectable
class AdvertiseInfoCubit extends Cubit<AdvertiseInfoState> {
  AdvertiseInfoCubit(this.advertiseAccountRepo) : super(AdvertiseInfoInitial());
  AdvertiseAccountRepo advertiseAccountRepo;
  AdvertiseInfoModel? advertiseInfoModel;
  bool isDone = false;

  static AdvertiseInfoCubit get(context) => BlocProvider.of(context);

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
        advertiseInfoModel = advertise;
        isDone = true;
        emit(AdvertiseAccountSuccessState());
      },
    );
  }

  editAdvertiser(EditAdvertiseData advertise) async {
    emit(AdvertiseAccountLoadingState());
    var result = await advertiseAccountRepo.editAdvertise(advertise);
    result.fold(
      (l) {
        emit(AdvertiseAccountFailState(l.message));
      },
      (r) {
        emit(AdvertiseAccountSuccessState());
      },
    );
  }

  deleteCampaign(num? campaignId) async {
    var result = await advertiseAccountRepo.deleteCampaign(campaignId);
    result.fold(
      (fail) {
        emit(AdvertiseAccountFailState(fail.message));
      },
      (success) {
        emit(AdvertiseAccountDeleteCampaignSuccessState());
      },
    );
  }

  getUnApproveCampaigns() async {
    emit(AdvertiseAccountGetUnApproveLoadingState());
    var result = await advertiseAccountRepo.getAdvertiserUnApprovedCampaign();
    result.fold((fail) {
      emit(AdvertiseAccountGetUnApproveFailState(fail.message));
    }, (campaigns) {
      emit(AdvertiseAccountGetUnApproveSuccessState(campaigns));
    });
  }
}
