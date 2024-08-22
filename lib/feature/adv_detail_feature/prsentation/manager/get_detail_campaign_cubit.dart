import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/repo/campaign_detail_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'get_detail_campaign_state.dart';

@injectable
class GetDetailCampaignCubit extends Cubit<GetDetailCampaignState> {
  GetDetailCampaignCubit(this.campaignDetailRepo)
      : super(GetDetailCampaignInitial());
  DetailCampaignModel? detailCampaignModel;
  CampaignDetailRepo campaignDetailRepo;

  getCampaignDetail(String campaignId) async {
    emit(GetDetailCampaignLoadingState());
    var result = await campaignDetailRepo.getDetails(campaignId);
    result.fold(
      (fail) {
        emit(GetDetailCampaignFailState(fail.message));

      },
      (r) {
        detailCampaignModel=r;
        emit(GetDetailCampaignSuccessState());
      },
    );
  }
}
